--local lsp = require("lsp-zero")
--
--lsp.preset("recommended")
--
--lsp.ensure_installed({
--  'tsserver',
--  'eslint',
--  'rust_analyzer',
--  'sumneko_lua',
--  'pyright'
--})
--
--local cmp = require('cmp')
--local cmp_action = require('lsp-zero').cmp_action()
--local lspkind = require('lspkind')
--
--cmp.setup({
--  completion = {
--    autocomplete = true
--  },
--  mapping = {
--	  ['<Tab>'] = cmp_action.tab_complete(),
--	  ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
--	  ['<CR>'] = cmp.mapping.confirm({select = true}),
--	  ['<C-Space>'] = cmp.mapping.complete(),
--  },
--
--  formatting = {
--    format = lspkind.cmp_format({
--      mode = 'symbol', -- show only symbol annotations
--      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
--
--      -- The function below will be called before any actual modifications from lspkind
--      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
--      before = function (entry, vim_item)
--	      return vim_item
--      end
--    })
--  }
--})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 
        'lua_ls',
        'rust_analyzer',
        'pyright',
        'eslint',
        'tsserver',
    }
})
require("mason-nvim-dap").setup({
    ensure_installed = { "python" }
})

local on_attach = function(_, bufner)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', '<leader>s', vim.lsp.buf.definition, {})
	vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', '<leader>f', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "/lua"] = true,
				},
			},
		},
	}
}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
}

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
}


require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
}

require('lspconfig').eslint.setup {
    on_attach = on_attach,
}
