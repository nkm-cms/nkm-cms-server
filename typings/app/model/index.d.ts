// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle from '../../../app/model/article';
import ExportCategory from '../../../app/model/category';
import ExportDictionary from '../../../app/model/dictionary';
import ExportResource from '../../../app/model/resource';
import ExportRole from '../../../app/model/role';
import ExportTags from '../../../app/model/tags';
import ExportUser from '../../../app/model/user';

declare module 'egg' {
  interface IModel {
    Article: ReturnType<typeof ExportArticle>;
    Category: ReturnType<typeof ExportCategory>;
    Dictionary: ReturnType<typeof ExportDictionary>;
    Resource: ReturnType<typeof ExportResource>;
    Role: ReturnType<typeof ExportRole>;
    Tags: ReturnType<typeof ExportTags>;
    User: ReturnType<typeof ExportUser>;
  }
}
