local colorscheme = nixCats("colorscheme")
if not require("nixCatsUtils").isNixCats then
	colorscheme = "rose-pine-moon"
end

vim.cmd.colorscheme(colorscheme)

require("config.plugins.completion")
require("config.plugins.layout")
require("config.plugins.style")
require("config.plugins.utilities")
