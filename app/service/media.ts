import { Service } from 'egg'
import path = require('path')
import fs = require('fs')
import { ROUTER_PREFIX } from '../settings'

export default class Media extends Service {
  readonly rootDir = path.join(__dirname, '../public/upload')

  private static isFile(file: string): boolean {
    const stats = fs.statSync(file)
    return stats.isFile()
  }

  public readDirectory(directory = '') {
    const { ctx } = this
    try {
      // 过滤不需要读取的文件
      const IGNORE_FILES = ['.DS_Store']

      const filePath = path.join(this.rootDir, directory)
      let files = fs.readdirSync(filePath)
      files = files.filter((item: any) => !IGNORE_FILES.includes(item))
      return files.map((item: any) => {
        const _stat = fs.statSync(path.join(filePath, item))
        item = {
          filename: item,
          isDirectory: _stat.isDirectory(),
          createTime: _stat.birthtime,
          size: ctx.helper.fileSizeFormatter(_stat.size),
          type: ctx.helper.getFileMimeType(item),
          url: _stat.isDirectory() ? '' : `${ROUTER_PREFIX}/readFile?path=${filePath.replace(this.rootDir, '/upload')}/${item}`
        }
        return item
      }).sort((a, b) => b.isDirectory - a.isDirectory)
    } catch (err) {
      return ctx.throw(200, ctx.errorMsg.media.noFileOrDirectory)
    }
  }

  public createDirectory() {
    const { ctx } = this
    const dirPath = path.join(this.rootDir, ctx.request.body.path, ctx.request.body.name)
    if (fs.existsSync(dirPath)) ctx.throw(200, ctx.errorMsg.media.directoryAlreadyExists)
    ctx.validate({
      name: 'directory'
    })
    fs.mkdirSync(dirPath)
  }

  private deleteFile(filePath: string) {
    try {
      return fs.unlinkSync(filePath)
    } catch (err) {
      return this.ctx.throw(200, this.ctx.errorMsg.media.delFileFail)
    }
  }

  private deleteDirectory(filePath: string) {
    try {
      return fs.rmdirSync(filePath)
    } catch (err) {
      return this.ctx.throw(200, this.ctx.errorMsg.media.delDirectoryFail)
    }
  }

  public deleteFileOrDirectory() {
    const filePath = path.join(this.rootDir, this.ctx.request.body.path.replace('/upload', ''))
    return Media.isFile(filePath) ? this.deleteFile(filePath) : this.deleteDirectory(filePath)
  }
}
