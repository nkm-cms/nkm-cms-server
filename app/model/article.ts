import { Application } from 'egg'

export default function(app: Application) {
  const { BIGINT, INTEGER, STRING, TEXT } = app.Sequelize
  const Article = app.model.define('article', {
    id: {
      type: BIGINT,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: BIGINT,
      allowNull: false
    },
    category_id: {
      type: BIGINT,
      allowNull: false
    },
    content: {
      type: STRING,
      allowNull: false,
      defaultValue: ''
    },
    images: {
      type: STRING,
      defaultValue: ''
    },
    title: {
      type: TEXT,
      allowNull: false,
      defaultValue: ''
    },
    thumbnail: {
      type: STRING,
      defaultValue: ''
    },
    create_time: {
      type: BIGINT,
      defaultValue: Date.now()
    },
    status: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 1,
      comment: '0: 草稿；1：已发布'
    },
    is_deleted: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0,
      comment: '0：未删除；1：已删除'
    }
  })

  return class extends Article {
    static readonly tableName = 'nkm_article'

    static associate() {
      app.model.Article.belongsTo(app.model.User, {
        foreignKey: 'user_id',
        as: 'user'
      })

      app.model.Article.belongsTo(app.model.Category, {
        foreignKey: 'category_id',
        as: 'category'
      })
    }
  }
}
