--> Configuration for packer.nvim
--> Imported by plugin.lua

local packer_bootstrap = false --> indicate 1st time installation

-- packer.nvim configuration
local conf = {
  display = {
    open_fn = function()
      return require("packer.util").float( {border="rounded"} )
    end,
  },
}

-- check if packer.nvim is installed
-- if any changes in this file run PackerCompile
local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath("data") ..
      "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git", "clone", "--depth", "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[ packadd packer.nvim ]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

--=============================================================================
-- List of Plugins
--=============================================================================
local function plugins(use)
  -----------------------------------------------------------------------------
  --> Manage packer.nvim plugin manager
  use "wbthomason/packer.nvim"

  --> Splash screen
  use { "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      local startify = require("alpha.themes.startify")
      require("alpha").setup(startify.opts)
      startify.section.bottom_buttons.val = {
        startify.button("v", "Neovim Config",
            "<cmd>e ~/.config/nvim/init.lua<cr>"),
        startify.button("q", "Quit Neovim",   "<cmd>q <cr>"),
      }
    end
  }

  --> Colorschemes
  use "folke/tokyonight.nvim" --> TokyoNight colorscheme for VSCode
  use "tomasr/molokai"        --> vim port of Monokai theme for TextMate
  use "joshdick/onedark.vim"  --> theme inspired by Atom
  use "morhetz/gruvbox"       --> community groove colorscheme
  use "tomasiser/vim-code-dark" --> inspired by Dark+ scheme of VSCode
  use "EdenEast/nightfox.nvim"  --> dark theme written in lua
  use "vim-scripts/CycleColor"  --> cycle through colorschemes in rtp
  use "sainnhe/sonokai"  --> high-contrast, vivid theme based on Monokai Pro
  use "NLKNguyen/papercolor-theme" --> inspired by Google's Material Design

  --> Utilities for coding
  use "jiangmiao/auto-pairs" --> autocomplete & link parenthesis
  use "tpope/vim-commentary" --> gc/gcc to comment/uncomment

  -- use "norcalli/nvim-colorizer.lua" --> highlight colorcodes in relevant color
  use { "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }

  --> Statusline
  use { "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true } }

  --> Persistant floating terminals that can be toggled
  use { "akinsho/toggleterm.nvim", tag = "v2.*" }

  --> Git support
  use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }

  --> Show levels of indentation
  use "lukas-reineke/indent-blankline.nvim"

  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- PARSE PROGRAMMING LANGUAGE SOURCE CODE
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  use { "nvim-treesitter/nvim-treesitter", run = "<Cmd>TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-textobjects"

  --> Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = "<Cmd>TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-textobjects"

  --> Configurations for builtin LSP client
  use "neovim/nvim-lspconfig"

  if packer_bootstrap then
    print "Need to restart neovim after installation!"
    require("packer").sync()
  end
end

--=============================================================================

packer_init()

local packer = require "packer"
packer.init(conf)
packer.startup(plugins)
