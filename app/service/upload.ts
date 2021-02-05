import { Service } from 'egg'
import path = require('path')
import fs = require('fs')
import { ROUTER_PREFIX } from '../settings'

interface FileResponse {
  url: string;
  name: string;
  type: string;
}

export default class extends Service {
  public async upload() {
    const { ctx, app } = this
    // 存放文件的目录
    const rootDir = path.join(__dirname, '../public/upload')

    // 上传类型
    const type = ctx.request.body.type

    // 是否为媒体库上传
    const isMedia = ctx.request.body.type === 'media'
    const mediaUploadPath = ctx.request.body.path

    const year = ctx.datejs().format('yyyy')
    const month = ctx.datejs().format('MM')

    // 文件上传类型
    const dirType = ['account', 'editor']
    const fileType = dirType.indexOf(type) === -1 ? '' : type

    let writeDir = ''

    // 判断目录是否存在
    !fs.existsSync(rootDir) && fs.mkdirSync(rootDir)
    if (isMedia) {
      if (!mediaUploadPath) ctx.throw(200, ctx.errorMsg.media.pathIsEmpty)
      const _path = path.join(rootDir, mediaUploadPath)
      !fs.existsSync(_path) && fs.mkdirSync(_path)
      writeDir = _path
    } else {
      !fs.existsSync(`${rootDir}/${year}`) && fs.mkdirSync(`${rootDir}/${year}`)
      !fs.existsSync(`${rootDir}/${year}/${month}`) && fs.mkdirSync(`${rootDir}/${year}/${month}`)
      !fs.existsSync(`${rootDir}/${year}/${month}/${fileType}`) && fs.mkdirSync(`${rootDir}/${year}/${month}/${fileType}`)
      writeDir = `${rootDir}/${year}/${month}/${fileType}`
    }

    const files: FileResponse[] = []
    const filesRelativeAddress: string[] = []
    for (let i = 0; i < ctx.request.files.length; i++) {
      const file = ctx.request.files[i]
      // 创建可读流
      const reader = fs.createReadStream(file.filepath)

      // 获取上传文件扩展名
      const ext = file.filename.split('.').pop()

      // 文件名
      const filename = `${ctx.datejs().format('yyyyMMddHHmmss')}${Math.random().toString().substring(2, 8)}.${ext}`

      // 创建可写流
      const upStream = fs.createWriteStream(`${writeDir}/${isMedia ? file.filename : filename}`)
      const relativeAddress = isMedia ? path.join('/upload', mediaUploadPath, file.filename) : `/upload/${year}/${month}/${fileType}/${filename}`
      const remoteAddress = `${ROUTER_PREFIX}/readfile?path=${relativeAddress}`

      // 可读流通过管道写入可写流
      reader.pipe(upStream)

      files.push({
        url: remoteAddress,
        type: file.mime,
        name: filename
      })
      filesRelativeAddress.push(relativeAddress)
    }

    // 将文件地址保存到redis中
    if (!isMedia) await app.redis.rpush('files', filesRelativeAddress)

    return files
  }

  public async readFile() {
    const { ctx } = this
    const filePath = path.join(__dirname, `../public/${ctx.request.query.path}`)
    let stream = fs.createReadStream(filePath)
    stream.on('error', () => ctx.logger.warn(`文件读取失败：${ctx.url}`))
    const { size: fileSize } = fs.statSync(filePath)

    try {
      // 查看请求是否分段
      const range = ctx.request.headers.range
      if (range) {
        // 获取范围的开始和结束
        let { start, end } = (/bytes=(?<start>\d+)-(?<end>\d+)?/.exec(range) || {}).groups || {
          start: 0,
          end: 0
        }
        start = Number(start)
        end = Number(end) ? Number(end) : start + 999999
        end = end > fileSize - 1 ? fileSize - 1 : end
        const chunksize = (end - start) + 1
        ctx.set({
          'Content-Range': `bytes ${start}-${end}/${fileSize}`,
          'Accept-Ranges': 'bytes',
          'Content-Length': chunksize + '',
          'Content-Type': 'application/octet-stream'
        })
        ctx.status = 206
        stream = fs.createReadStream(filePath, {
          start,
          end
        })
      } else {
        ctx.set({
          'Content-Length': fileSize + '',
          'Content-Type': 'application/octet-stream'
        })
      }
    } catch (err) {
      ctx.logger.warn(`文件读取失败：${ctx.url}`)
    }
    ctx.attachment(decodeURIComponent(ctx.request.query.path.split('/').reverse()[0]))
    ctx.body = stream
  }
}
