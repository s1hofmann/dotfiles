require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "cmake", "serve_d", "jsonls", "svelte", "tsserver", "rust_analyzer" }
})
