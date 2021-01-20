import { Service } from 'egg'
import path = require('path')
import fs = require('fs')
import { ROUTER_PREFIX } from '../settings'

export default class Media extends Service {
  readonly rootDir = path.join(__dirname, '../public')

  public readDirectory(directory = '') {
    const { ctx } = this
    try {
      const ISNORE_FILE = ['.DS_Store']
      const filePath = path.join(this.rootDir, directory)
      let files = fs.readdirSync(filePath)
      files = files.filter((item: any) => !ISNORE_FILE.includes(item))
      return files.map((item: any) => {
        const _stat = fs.statSync(path.join(filePath, item))
        item = {
          filename: item,
          isDirectory: _stat.isDirectory(),
          createTime: _stat.birthtime,
          size: _stat.size,
          type: ctx.helper.getFileMimeType(item),
          url: _stat.isDirectory() ? '' : `${ROUTER_PREFIX}/readfile?path=${filePath.replace(this.rootDir, '')}/${item}`
        }
        return item
      }).sort((a, b) => b.isDirectory - a.isDirectory)
    } catch (err) {
      return ctx.throw(200, ctx.errorMsg.media.noFileOrDirectory)
    }
  }
}
