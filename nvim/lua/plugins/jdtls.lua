return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  dependencies = { 'neovim/nvim-lspconfig' },
  config = function()
    local jdtls_path = '/home/renanalves/.local/share/nvim/mason/packages/jdtls'
    local jdtls_launcher = jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar'
    local lombok_jar = jdtls_path .. '/lombok.jar'

    -- Bundles for jdtls extensions
    local bundles = {
      '/home/renanalves/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.2.jar',
      '/home/renanalves/.local/share/nvim/mason/packages/java-test/extension/server/com.microsoft.java.test.plugin-0.43.1.jar',
      -- Add the gradle bundle here when you have it
    }

    -- The configuration for jdtls
    local config = {
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1.XmlServerApplication',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_jar,
        '-jar',
        jdtls_launcher,
        '-configuration',
        jdtls_path .. '/config_linux', -- Use config_mac for macOS, config_win for Windows
        '-data',
        '/home/renanalves/.config/nvim/jdtls-workspace/'
      },
      root_dir = require('jdtls.setup').find_root({ 'gradlew', 'mvnw', '.git' }),
      init_options = {
        bundles = bundles,
      },

      -- Here you can configure eclipse.jdt.ls specific settings
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = 'fernflower' },
        },
      },

      -- The on_attach function is called when the language server is attached to a buffer
      on_attach = function(client, bufnr)
        local jdtls = require('jdtls')
        jdtls.setup_dap({ hotcodereplace = 'auto' })
        jdtls.setup.add_commands()

        -- Keymaps
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', '<leader>oi', jdtls.organize_imports, opts)
        vim.keymap.set('n', '<leader>ev', jdtls.extract_variable, opts)
        vim.keymap.set('n', 'gf', jdtls.goto_forward, opts)
        vim.keymap.set('n', '<leader>ec', jdtls.extract_constant, opts)
        vim.keymap.set('v', '<leader>em', jdtls.extract_method, opts)
        vim.keymap.set('n', '<leader>crv', jdtls.change_runtime_version, opts)
      end,
    }

    require('jdtls').start_or_attach(config)
  end
}
