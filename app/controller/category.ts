import BaseController from './BaseController'

export default class extends BaseController {
  public async save() {
    await this.service.category.save(this.ctx.request.body)
    this.ctx.body = this.success()
  }

  public async getList() {
    const { ctx } = this
    const data = await this.service.category.getList()
    ctx.body = this.success({
      data
    })
  }

  public async del() {
    await this.service.category.del(this.ctx.request.body.id)
    this.ctx.body = this.success()
  }

  public async getAllListFront() {
    const { ctx } = this
    const data = await this.service.category.getAllListFront()
    ctx.body = this.success({
      data
    })
  }
}
