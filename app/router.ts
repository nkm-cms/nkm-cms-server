import { Application } from 'egg'
import { ROUTER_PREFIX } from './settings'

export default (app: Application) => {
  const { controller, router } = app

  router.prefix(ROUTER_PREFIX)

  router.post('/login', controller.login.login)

  router.post('/login-out', controller.loginOut.loginOut)

  router.post('/upload', controller.upload.upload)
  router.get('/readfile', controller.upload.readFile)

  router.get('/system/user/list', controller.system.user.getUserList)
  router.post('/system/user/registered', controller.system.user.registered)
  router.post('/system/user/del', controller.system.user.del)
  router.post('/system/user/modify-status', controller.system.user.modifyStatus)
  router.post('/system/user/modify-role', controller.system.user.modifyRole)
  router.post('/system/user/reset-password', controller.system.user.resetPassword)
  router.post('/system/user/modify-password', controller.system.user.modifyPassword)
  router.post('/system/user/update-info', controller.system.user.updateUserInfo)

  router.post('/system/resource/save', controller.system.resource.save)
  router.post('/system/resource/del', controller.system.resource.del)
  router.get('/system/resource/tree', controller.system.resource.getTree)
  router.get('/system/resource/list', controller.system.resource.getList)

  router.get('/system/role/list', controller.system.role.getList)
  router.post('/system/role/save', controller.system.role.save)
  router.post('/system/role/del', controller.system.role.del)

  router.get('/system/dictionary/tree', controller.system.dictionary.getTree)
  router.post('/system/dictionary/save', controller.system.dictionary.save)
  router.post('/system/dictionary/del', controller.system.dictionary.del)

  router.get('/article/list', controller.article.getList)
  router.get('/article/detail/:id', controller.article.getDetail)
  router.post('/article/save', controller.article.save)
  router.post('/article/del', controller.article.del)

  router.get('/category/list', controller.category.getList)
  router.post('/category/save', controller.category.save)
  router.post('/category/del', controller.category.del)

  router.get('/tags/list', controller.tags.getList)
  router.post('/tags/save', controller.tags.save)
  router.post('/tags/del', controller.tags.del)

  router.post('/media/read-directory', controller.media.readDirectory)

  router.get('/captcha', controller.captcha.init)
}
