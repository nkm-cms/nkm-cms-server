import BaseController from './BaseController'

export default class extends BaseController {
  public async save() {
    this.ctx.body = this.success({
      data: await this.ctx.service.tags.save(this.ctx.request.body)
    })
  }

  public async getList() {
    const { ctx } = this
    const { rows: data, count } = await this.service.tags.getList(ctx.conversionPagination(ctx.query))
    ctx.body = this.success({
      data,
      count
    })
  }

  public async del() {
    await this.service.tags.del(this.ctx.request.body.id)
    this.ctx.body = this.success()
  }
}
