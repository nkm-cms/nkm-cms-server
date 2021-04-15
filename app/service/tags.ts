import { Service } from 'egg'

export default class Tags extends Service {
  public save({
    id,
    name,
    code
  }: {
    id?: number;
    name: string;
    code: string;
  }) {
    this.ctx.validate({
      name: 'name',
      code: 'code'
    })

    const option = {
      id,
      name,
      code,
      create_time: new Date()
    }
    if (id) delete option.create_time

    return this.ctx.model.Tags.upsert(option)
  }

  public getList({ page, limit }) {
    return this.ctx.model.Tags.findAndCountAll({
      limit,
      offset: page * limit,
      attributes: [
        'id',
        'name',
        'code',
        'create_time'
      ],
      where: {
        is_deleted: 0
      },
      order: [['create_time', 'desc']],
      raw: true
    })
  }

  public getAllList() {
    return this.ctx.model.Tags.findAll({
      attributes: [
        'id',
        'name',
        'code'
      ],
      where: {
        is_deleted: 0
      },
      order: [['create_time', 'desc']],
      raw: true
    })
  }

  public async del(id: number) {
    return this.ctx.model.Tags.update({
      is_deleted: 1
    }, {
      where: {
        id
      }
    })
  }
}
