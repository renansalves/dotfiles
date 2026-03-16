return {
  cmd = { 'jdtls' },
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),
  root_markers = { '', 'compile_commands.json' },
  filetypes = { 'java' },
  settings = {
    java = {
        -- Custom eclipse.jdt.ls options go here
    },
  }
}
