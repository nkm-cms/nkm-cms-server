import { EggAppConfig, PowerPartial } from 'egg'

export default () => {
  const config: PowerPartial<EggAppConfig> = {}

  config.sequelize = {
    password: '',
    database: 'nkm_cms'
  }

  return config
}
