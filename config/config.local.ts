import { EggAppConfig, PowerPartial } from 'egg'

export default () => {
  const config: PowerPartial<EggAppConfig> = {}
  config.sequelize = {
    password: '123456.x',
    database: 'nkm_cms_test'
  }
  return config
}
