// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
type AnyClass = new (...args: any[]) => any;
type AnyFunc<T = any> = (...args: any[]) => T;
type CanExportFunc = AnyFunc<Promise<any>> | AnyFunc<IterableIterator<any>>;
type AutoInstanceType<T, U = T extends CanExportFunc ? T : T extends AnyFunc ? ReturnType<T> : T> = U extends AnyClass ? InstanceType<U> : U;
import ExportArticle from '../../../app/service/article';
import ExportCaptcha from '../../../app/service/captcha';
import ExportCategory from '../../../app/service/category';
import ExportLogin from '../../../app/service/login';
import ExportLoginOut from '../../../app/service/loginOut';
import ExportTags from '../../../app/service/tags';
import ExportUpload from '../../../app/service/upload';
import ExportSystemDictionary from '../../../app/service/system/dictionary';
import ExportSystemResource from '../../../app/service/system/resource';
import ExportSystemRole from '../../../app/service/system/role';
import ExportSystemUser from '../../../app/service/system/user';

declare module 'egg' {
  interface IService {
    article: AutoInstanceType<typeof ExportArticle>;
    captcha: AutoInstanceType<typeof ExportCaptcha>;
    category: AutoInstanceType<typeof ExportCategory>;
    login: AutoInstanceType<typeof ExportLogin>;
    loginOut: AutoInstanceType<typeof ExportLoginOut>;
    tags: AutoInstanceType<typeof ExportTags>;
    upload: AutoInstanceType<typeof ExportUpload>;
    system: {
      dictionary: AutoInstanceType<typeof ExportSystemDictionary>;
      resource: AutoInstanceType<typeof ExportSystemResource>;
      role: AutoInstanceType<typeof ExportSystemRole>;
      user: AutoInstanceType<typeof ExportSystemUser>;
    }
  }
}
