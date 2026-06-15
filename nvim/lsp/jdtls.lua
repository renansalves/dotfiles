local home = vim.fn.expand('~')
local lombok_jars = vim.fn.glob(
  home .. '/.m2/repository/org/projectlombok/lombok/*/lombok-*.jar',
  false, true
)
local lombok_jar = lombok_jars[#lombok_jars]

return {
  cmd = function(dispatchers, config)
    local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls/workspace'
    local data_dir = workspace_dir

    if config.root_dir then
      data_dir = data_dir .. '/' .. vim.fn.fnamemodify(config.root_dir, ':p:h:t')
    end

    local config_cmd = { 'jdtls', '-data', data_dir }

    if lombok_jar then
      table.insert(config_cmd, '--jvm-arg=-javaagent:' .. lombok_jar)
    end

    return vim.lsp.rpc.start(config_cmd, dispatchers, {
      cwd = config.cmd_cwd,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  filetypes = { 'java' },
}
