return {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    bin = 'prettierd',
    ft = {'javascript',
    'typescript',
    'css',
    'scss',
    'json',
    'graphql',
    'markdown',
    'vue',
    'yaml',
    'html'}
  }
