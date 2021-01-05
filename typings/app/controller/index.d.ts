// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportBaseController from '../../../app/controller/BaseController';
import ExportArticle from '../../../app/controller/article';
import ExportCaptcha from '../../../app/controller/captcha';
import ExportCategory from '../../../app/controller/category';
import ExportLogin from '../../../app/controller/login';
import ExportLoginOut from '../../../app/controller/loginOut';
import ExportTags from '../../../app/controller/tags';
import ExportUpload from '../../../app/controller/upload';
import ExportSystemDictionary from '../../../app/controller/system/dictionary';
import ExportSystemResource from '../../../app/controller/system/resource';
import ExportSystemRole from '../../../app/controller/system/role';
import ExportSystemUser from '../../../app/controller/system/user';

declare module 'egg' {
  interface IController {
    baseController: ExportBaseController;
    article: ExportArticle;
    captcha: ExportCaptcha;
    category: ExportCategory;
    login: ExportLogin;
    loginOut: ExportLoginOut;
    tags: ExportTags;
    upload: ExportUpload;
    system: {
      dictionary: ExportSystemDictionary;
      resource: ExportSystemResource;
      role: ExportSystemRole;
      user: ExportSystemUser;
    }
  }
}
