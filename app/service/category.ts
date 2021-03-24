import { Service } from 'egg'

interface CreateOption {
  id: number;
  name: string;
  code: string;
  path: string;
  isDeleted: number;
  type: string;
  parentId: number;
  sort: number;
  visible: number;
}

export default class Category extends Service {
  private async _queryTheExistenceById(id: number) {
    const { ctx } = this
    const category = await ctx.model.Category.findByPk(id)
    if (!category) return ctx.throw(200, ctx.errorMsg.category.notExists)
  }

  // 保存、更新栏目
  public async save({ id, name, code, type, parentId, sort, visible, path }: CreateOption) {
    const { ctx } = this

    ctx.validate({
      name: {
        type: 'string',
        required: true
      },
      code: {
        type: 'string',
        required: true
      }
    })

    // 父级栏目不能为空
    if (ctx.helper.isEmpty(parentId)) return ctx.throw(200, ctx.errorMsg.category.noParentId)

    // 父级栏目不能为自己
    if (id === +parentId) return ctx.throw(200, ctx.errorMsg.category.parentCannotIsSelf)

    const userId = await this.app.redis.hget(ctx.request.header.token, 'id')

    const option = {
      id,
      name,
      code,
      user_id: userId,
      create_time: Date.now(),
      type,
      sort,
      parent_id: parentId,
      visible,
      path
    }

    if (id) delete option.create_time

    return ctx.model.Category.upsert(option)
  }

  public async getList() {
    return this.ctx.model.Category.findAll({
      include: [{
        model: this.ctx.model.User,
        as: 'user',
        attributes: ['display_name']
      }],
      attributes: [
        'id',
        'name',
        'code',
        'sort',
        'path',
        'parent_id',
        'is_deleted',
        'create_time',
        'type',
        'visible'
      ],
      where: {
        is_deleted: 0
      },
      order: [['create_time', 'desc']],
      raw: true
    })
  }

  public async del(id: number) {
    await this._queryTheExistenceById(id)
    return this.ctx.model.Category.update({
      is_deleted: 1
    }, {
      where: {
        id
      }
    })
  }
}
