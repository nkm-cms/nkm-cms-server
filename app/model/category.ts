import { Application } from 'egg'

export default function(app: Application) {
  const { BIGINT, STRING, INTEGER } = app.Sequelize

  const Category = app.model.define('category', {
    id: {
      type: BIGINT,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: STRING(255),
      allowNull: false,
      defaultValue: ''
    },
    code: {
      type: STRING(255),
      allowNull: false,
      defaultValue: ''
    },
    path: {
      type: STRING(255),
      allowNull: false,
      defaultValue: ''
    },
    type: {
      type: STRING,
      allowNull: false,
      defaultValue: 'list'
    },
    user_id: {
      type: BIGINT,
      allowNull: false
    },
    parent_id: {
      type: BIGINT,
      allowNull: false,
      defaultValue: 0
    },
    sort: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    create_time: {
      type: BIGINT,
      defaultValue: Date.now()
    },
    visible: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 1,
      comment: '0：不可见；1：可见'
    },
    is_deleted: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0,
      comment: '0：未删除；1：已删除'
    }
  })

  return class extends Category {
    static readonly tableName = 'nkm_category'

    static associate() {
      app.model.Category.belongsTo(app.model.Article, {
        foreignKey: 'id',
        as: 'article'
      })

      app.model.Category.belongsTo(app.model.User, {
        foreignKey: 'user_id',
        as: 'user'
      })
    }
  }
}
