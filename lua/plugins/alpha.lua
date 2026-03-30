return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		dashboard.section.header.opts.hl = "GruvboxGreen"
		-- Set menu

		local function button_hl(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl = "GruvboxBlue"
			b.opts.hl_shortcut = "GruvboxOrange"
			return b
		end
		dashboard.section.buttons.val = {
			button_hl("i", "  > New file", ":ene <BAR> startinsert <CR>"),
			button_hl("f", "󰍉  > Find file", ":Telescope find_files<CR>"),
			button_hl("o", "  > Recent", ":Telescope oldfiles<CR>"),
			button_hl("s", "  > Settings", ":e $MYVIMRC | cd %:p:h | Telescope find_files <CR>"),
			button_hl("q", "󰅙  > Quit NVIM", ":qa<CR>"),
		}

		local fortune = require("alpha.fortune")
		dashboard.section.footer.val = fortune()
		dashboard.section.footer.opts.hl = "Comment"

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
