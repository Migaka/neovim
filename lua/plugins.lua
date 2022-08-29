-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
-- Packer
    use 'wbthomason/packer.nvim'

-- Theming
    use 'Mofiqul/dracula.nvim' -- Colorscheme
    use {'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
--]]

-- Startup-nvim
    use {
        'startup-nvim/startup.nvim',
        config = function()
            require"startup".setup()
        end
    }
--]]

-- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'

-- Discord presence
    use 'andweeb/presence.nvim'

-- Completion and lsp
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-lint'
    use 'mhartington/formatter.nvim'
--]]
-- Neovim-tree lua
use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
--]]

end)
