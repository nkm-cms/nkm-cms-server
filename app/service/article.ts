import { Service } from 'egg'

interface CreateOption {
  id: number;
  userId: number;
  content: string;
  title: string;
  status?: number;
  categoryId: number;
  thumbnail: string;
}

export default class Article extends Service {
  private async _queryTheExistenceById(id: number) {
    const { ctx } = this
    const article = await ctx.model.Article.findByPk(id, {
      raw: true
    })
    if (!article) return ctx.throw(200, ctx.errorMsg.article.notExists)
    return article
  }

  public async save({ id, content, title, status = 1, categoryId, thumbnail }: CreateOption) {
    const { ctx, app } = this

    const userId = await this.app.redis.hget(ctx.request.header.token, 'id')

    // 保存之前先查出当前文章信息，并判断该文章是否为当前用的文章
    if (id) {
      const article: any = await this._queryTheExistenceById(id)
      if (article.user_id !== Number(userId)) return ctx.throw(200, ctx.errorMsg.article.noSaveAuthority)
    }

    ctx.validate({
      title: 'string'
    })

    // 匹配出文章中的文件路径，从reids中删除匹配的文件路径
    await ctx.deleteFilesByReids(content, app)

    const option = {
      id,
      content,
      title,
      status,
      category_id: categoryId,
      user_id: userId,
      thumbnail,
      create_time: Date.now()
    }

    if (id) delete option.create_time

    return ctx.model.Article.upsert(option)
  }

  public async getList({
    page = 1,
    limit
  }) {
    return this.ctx.model.Article.findAndCountAll({
      limit,
      offset: page,
      include: [{
        model: this.ctx.model.User,
        as: 'user',
        attributes: ['display_name']
      }, {
        model: this.ctx.model.Category,
        as: 'category',
        attributes: ['name']
      }],
      attributes: [
        'id',
        'title',
        'status',
        'is_deleted',
        'create_time',
        'category_id',
        'thumbnail'
      ],
      where: {
        is_deleted: 0
      },
      order: [['create_time', 'desc']],
      raw: true
    })
  }

  public async getDetail(id: number) {
    const article = await this.ctx.model.Article.findByPk(id, {
      attributes: [
        'id',
        'title',
        'content',
        'status',
        'is_deleted',
        'create_time',
        'category_id',
        'thumbnail',
        'images'
      ],
      include: [{
        model: this.ctx.model.User,
        as: 'user',
        attributes: ['display_name']
      }, {
        model: this.ctx.model.Category,
        as: 'category',
        attributes: ['name']
      }],
      raw: true
    })
    if (!article) return this.ctx.throw(200, this.ctx.errorMsg.article.notExists)
    return article
  }

  public async del(id: number) {
    const userId = await this.app.redis.hget(this.ctx.request.header.token, 'id')
    const isSystemAdmin = await this.app.redis.hget(this.ctx.request.header.token, 'isSystemAdmin')

    // 保存之前先查出当前文章信息，并判断该文章是否为当前用的文章
    const article: any = await this._queryTheExistenceById(id)
    if (!Number(isSystemAdmin) && article.user_id !== Number(userId)) return this.ctx.throw(200, this.ctx.errorMsg.article.noDelAuthority)

    return this.ctx.model.Article.update({
      is_deleted: 1
    }, {
      where: {
        id
      }
    })
  }
}
