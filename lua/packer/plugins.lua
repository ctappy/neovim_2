local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- TODO should put every plugin config inside packer.config file and for every one I should put readme on it
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("tpope/vim-fugitive")
  use("yamatsum/nvim-cursorline")
  use({ "turbio/bracey.vim", run = "npm install --prefix server" })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })
  use(require("packer.config.renamer"))
  use(require("packer.config.autotag"))
  use(require("packer.config.spectre"))
  use({ "tpope/vim-surround" })
  use(require("packer.config.regexplainer"))
  use(require("packer.config.hop"))
  use(require("packer.config.rainbow"))
  use(require("packer.config.alpha"))
  use(require("packer.config.blankline"))
  use(require("packer.config.winshift"))
  use(require("packer.config.telescope"))
  use({ "folke/tokyonight.nvim" })
  use(require("packer.config.windline"))
  use(require("packer.config.gitsigns"))
  use(require("packer.config.treesitter"))
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("romgrk/nvim-treesitter-context")
  use(require("packer.config.lspsaga"))
  use(require("packer.config.trouble"))
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use(require("packer.config.snippy"))
  use(require("packer.config.cmp"))
  use("dcampos/cmp-snippy")
  use("tversteeg/registers.nvim")
  use(require("packer.config.autopairs"))
  use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
  use(require("packer.config.bufferline"))
  use(require("packer.config.tree"))
  use(require("packer.config.project"))
  use("nathom/filetype.nvim")
  use(require("packer.config.twilight"))
  use(require("packer.config.formatter"))
  use(require("packer.config.which-key"))
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use(require("packer.config.comment"))
  use(require("packer.config.stablize"))
  use({ "ellisonleao/glow.nvim" })
  use(require("packer.config.rest"))
  use(require("packer.config.hlslens"))
  use(require("packer.config.rust"))
  use(require("packer.config.crates"))
  use({ "mfussenegger/nvim-dap" })
  use(require("packer.config.colorizer"))
  use({ "haringsrob/nvim_context_vt" })
  use({ "pgdouyon/vim-yin-yang" })
  use(require("packer.config.escap"))
  use(require("packer.config.numb"))
  use({ "github/copilot.vim" })
  use(require("packer.config.bisquits"))
  use(require("packer.config.neoscroll"))
  use(require("packer.config.noice"))

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
