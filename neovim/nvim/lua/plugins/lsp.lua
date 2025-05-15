-- Automatically set filetype to bash for files with a bash shebang
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*",
  callback = function()
    local first_line = vim.fn.getline(1)
    if first_line:match("^#!.*/bash") then
      vim.bo.filetype = "sh"
    end
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {
          filetypes = { "yaml" },
        },
        bashls = {},
        groovyls = {},
        powershell_es = {},
      },
    },
  },
}
