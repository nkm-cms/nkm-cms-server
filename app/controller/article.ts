import BaseController from './BaseController'

export default class extends BaseController {
  public async save() {
    await this.service.article.save(this.ctx.request.body)
    this.ctx.body = this.success()
  }

  public async getList() {
    const { ctx } = this
    const { rows: data, count } = await this.service.article.getList(ctx.conversionPagination(ctx.query as any))
    ctx.body = this.success({
      data,
      count
    })
  }

  public async getDetail() {
    this.ctx.body = this.success({
      data: await this.service.article.getDetail(this.ctx.params.id)
    })
  }

  public async del() {
    await this.service.article.del(this.ctx.request.body.id)
    this.ctx.body = this.success()
  }
}
