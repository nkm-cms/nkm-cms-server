import { Service } from 'egg'

interface CreateOption {
  id: number;
  userId: number;
  title: string;
  content: string;
  tags: string;
  summary: string;
  status: number;
  categoryId: number;
  thumbnail: string;
  top: number;
}

export default class Article extends Service {
  // 通过id查找文章是否存在
  private async _queryTheExistenceById(id: number) {
    const { ctx } = this
    const article = await ctx.model.Article.findByPk(id, {
      raw: true
    })
    if (!article) return ctx.throw(200, ctx.errorMsg.article.notExists)
    return article
  }

  // 新增文章、保存文章，有id则更新，否则为新增
  public async save({
    id,
    title,
    content,
    tags,
    summary,
    status = 1,
    categoryId,
    thumbnail,
    top
  }: CreateOption) {
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
    await ctx.deleteFilesByReids(thumbnail, app)

    const option = {
      id,
      title,
      content,
      tags,
      summary,
      status,
      category_id: categoryId,
      user_id: userId,
      thumbnail,
      top,
      create_time: new Date()
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
      offset: page * limit,
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
        'thumbnail',
        'views',
        'top'
      ],
      where: {
        is_deleted: 0
      },
      order: [
        ['create_time', 'desc']
      ],
      raw: true
    })
  }

  public async getDetail(id: number) {
    const article: any = await this.ctx.model.Article.findByPk(id, {
      attributes: [
        'id',
        'title',
        'content',
        'tags',
        'summary',
        'status',
        'is_deleted',
        'create_time',
        'category_id',
        'thumbnail',
        'top'
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
    article.tags = JSON.parse(article.tags || '[]')
    return article
  }

  public async del(id: number) {
    const userId = await this.app.redis.hget(this.ctx.request.header.token, 'id')
    const isSystemAdmin = await this.app.redis.hget(this.ctx.request.header.token, 'isSystemAdmin')

    // 保存之前先查出当前文章信息，并判断该文章是否为当前用的文章
    const article: any = await this._queryTheExistenceById(id)
    if (!Number(isSystemAdmin) && article.user_id !== Number(userId)) {
      return this.ctx.throw(200, this.ctx.errorMsg.article.noDelAuthority)
    }

    return this.ctx.model.Article.update({
      is_deleted: 1
    }, {
      where: {
        id
      }
    })
  }
}
