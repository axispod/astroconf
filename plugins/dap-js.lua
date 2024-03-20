return {
  {
    "mxsdev/nvim-dap-vscode-js",
    requires = {"mfussenegger/nvim-dap"},
    config = function()
      require('dap-vscode-js').setup({
        debugger_path = '~/.local/share/nvim/mason/packages/js-debug-adapter/',
        debugger_cmd = { 'js-debug-adapter' },
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
        node_path = 'node'
      })
    end
  },
}
