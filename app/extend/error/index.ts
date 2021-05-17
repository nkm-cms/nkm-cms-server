interface ErrorMessage {
  [key: string]: {
    readonly errorMsg: string;
    readonly code: string | number;
  };
}

const common: ErrorMessage = {
  success: {
    errorMsg: '请求成功',
    code: 200
  },

  failed: {
    errorMsg: '请求失败',
    code: 0
  },

  notFound: {
    errorMsg: 'Not Found',
    code: 404
  },

  serverError: {
    errorMsg: '服务内部错误',
    code: '10000'
  },

  verificationFailed: {
    errorMsg: '参数校验失败',
    code: '10001'
  },

  invalidToken: {
    errorMsg: '用户登录已过期',
    code: '10002'
  },

  noAuthority: {
    errorMsg: '暂无请求权限',
    code: '10003'
  },

  captchaError: {
    errorMsg: '验证码错误',
    code: '10004'
  }
}

const login: ErrorMessage = {
  noUser: {
    errorMsg: '用户不存在',
    code: '10100'
  },

  passwordError: {
    errorMsg: '密码错误',
    code: '10101'
  },

  authorityError: {
    errorMsg: '该账号暂无访问权限',
    code: '10102'
  }
}

const user: ErrorMessage = {
  registeredFailed: {
    errorMsg: '用户创建失败',
    code: '10200'
  },

  userExists: {
    errorMsg: '用户已存在',
    code: '10201'
  },

  userNotExists: {
    errorMsg: '用户不存在',
    code: '10202'
  }
}

const resource: ErrorMessage = {
  exists: {
    errorMsg: '资源编码已存在',
    code: '10300'
  },

  notExists: {
    errorMsg: '资源不存在',
    code: '10301'
  }
}

const role: ErrorMessage = {
  exists: {
    errorMsg: '角色已存在',
    code: '10400'
  },

  notExists: {
    errorMsg: '角色不存在',
    code: '10401'
  }
}

const dictionary: ErrorMessage = {
  exists: {
    errorMsg: '字典已存在',
    code: '10500'
  },

  notExists: {
    errorMsg: '字典不存在',
    code: '10501'
  }
}

const article: ErrorMessage = {
  notExists: {
    errorMsg: '文章不存在',
    code: '30000'
  },
  noSaveAuthority: {
    errorMsg: '暂无该文章的保存权限',
    code: '30001'
  },
  noDelAuthority: {
    errorMsg: '暂无该文章的删除权限',
    code: '30002'
  }
}

const category: ErrorMessage = {
  notExists: {
    errorMsg: '栏目不存在',
    code: '30100'
  },
  noParentId: {
    errorMsg: '父级栏目不能为空',
    code: '30101'
  },
  parentCannotIsSelf: {
    errorMsg: '父级栏目不能为自己',
    code: '30102'
  }
}

const media: ErrorMessage = {
  noFileOrDirectory: {
    errorMsg: '文件或目录不存在',
    code: '50000'
  },
  delFileFail: {
    errorMsg: '文件删除失败',
    code: '50001'
  },
  delDirectoryFail: {
    errorMsg: '文件夹删除失败',
    code: '50002'
  },
  pathIsEmpty: {
    errorMsg: '上传路径不能为空',
    code: '50003'
  },
  directoryAlreadyExists: {
    errorMsg: '目录已存在',
    code: '50004'
  }
}

export default {
  common,
  login,
  user,
  resource,
  role,
  dictionary,
  article,
  category,
  media
}
