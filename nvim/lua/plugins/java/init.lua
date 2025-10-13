return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          -- Your JDTLS configuration goes here
          jdtls = {
            settings = {
              java = {
                configuration = {
                  runtimes = {
                    {
                      name = "JavaSE-21",
                      path = "~/.sdkman/candidates/java/current",
                    },
                  },
                },
              },
            },
          },
        },
        setup = {
          jdtls = function()
            -- Your nvim-java configuration goes here
            require("java").setup({
              root_markers = {
                "settings.gradle",
                "settings.gradle.kts",
                "pom.xml",
                "build.gradle",
                "mvnw",
                "gradlew",
                "build.gradle",
                "build.gradle.kts",
              },
            })
          end,
        },
      },
    },
  },
}
-- return {
--   {
--     "nvim-java/nvim-java",
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "mfussenegger/nvim-dap", -- opcional: suporte a debug
--     },
--     opts = {
--       jdk = {
--         auto_install = false,
--       },
--       root_markers = {
--         "settings.gradle",
--         "settings.gradle.kts",
--         "pom.xml",
--         "build.gradle",
--         "build.gradle.kts",
--         "mvnw",
--         "gradlew",
--         ".git",
--       },
--       settings = {
--         java = {
--           configuration = {
--             runtimes = {
--               {
--                 name = "JavaSE-21",
--                 path = "~/.sdkman/candidates/java/current",
--               },
--             },
--           },
--         },
--       },
--     },
--   },
-- }
