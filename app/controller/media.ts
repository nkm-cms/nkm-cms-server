import BaseController from './BaseController'
export default class Media extends BaseController {
  public async readDirectory() {
    this.ctx.body = this.success({
      data: this.service.media.readDirectory(this.ctx.request.body.path)
    })
  }

  public async deleteFile() {
    this.ctx.body = this.success({
      data: this.service.media.deleteFile(this.ctx.request.body.path)
    })
  }
}
