--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Launch builtin LSP
--=============================================================================
local nvim_lsp = require "lspconfig"
local nvim_cmp = require "cmp_nvim_lsp"

-- Add additional capabilities supported by nvim-cmp
local capabilities = nvim_cmp.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local on_attach = require("plugins.lsp.utils").on_attach
local lsp_flags = {
  debounce_text_changes = 150, --> default
}

-- List of LSP servers to configure
local servers = {
  "pyright", --> python
  "sumneko_lua", --> lua
  "clangd", --> C, C++, Objective-C (https://clangd.llvm.org/features)
  "tsserver", --> typescript, javascript
  "bashls", --> bash, zsh
  "hls", --> haskell
  "rust_analyzer", --> rust
}

-- Settings dictionary modified if server is lua
local function get_settings(server)
  if server == "sumneko_lua" then
    return {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    }
    --> tips on starting: https://sharksforarms.dev/posts/neovim-rust/
    --> for rust-analyzer setup: https://github.com/simrat39/rust-tools.nvim
  elseif server == "rust-analyzer" then
    return {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      }
    }
  end
end

for _, server in ipairs(servers) do
  nvim_lsp[server].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = get_settings(server),
    capabilities = capabilities,
  }
end
