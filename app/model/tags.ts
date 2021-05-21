import { Application } from 'egg'

export default function(app: Application) {
  const { INTEGER, STRING, DATE } = app.Sequelize
  const Tags = app.model.define('tags', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    name: {
      type: STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    code: {
      type: STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    create_time: {
      type: DATE,
      defaultValue: new Date()
    },
    is_deleted: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0,
      comment: '0：未删除；1：已删除'
    }
  })

  return class extends Tags {
    static readonly tableName = 'nkm_tags'
  }
}
