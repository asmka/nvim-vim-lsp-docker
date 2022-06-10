-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Base
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'prabirshrestha/vim-lsp'
  use 'mattn/vim-lsp-settings'
end)
