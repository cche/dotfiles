-- npm install -g yaml-language-server
require'lspconfig'.yamlls.setup{
	cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
    on_attach = Common_on_attach,
}
