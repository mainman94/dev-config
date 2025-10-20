-- ========================================
-- 🤖 Copilot & CopilotChat Configuration
-- ========================================

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary", -- Verwende die neueste Version
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- Zusätzliche Abhängigkeit
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		event = { "BufReadPost", "BufNewFile" }, -- Lazy-Loading
		build = function()
			if vim.fn.executable("make") == 1 then
				return "make tiktoken"
			else
				print("Warning: 'make' not found, skipping tiktoken build.")
				return ""
			end
		end,
		opts = {
			model = 'gpt-4o', -- Verwendet ein bestätigtes Modell
			temperature = 0.1,
			window = {
				layout = 'float',
				width = 0.8, -- Relative Breite (80% des Fensters)
				height = 0.6, -- Relative Höhe (60% des Fensters)
				border = 'rounded',
				title = '🤖 AI Assistant',
				zindex = 50, -- Niedrigerer zindex für bessere Kompatibilität
			},
			headers = {
				user = '👤 You: ',
				assistant = '🤖 Copilot: ',
				tool = '🔧 Tool: ',
			},
			separator = '━━',
			show_folds = false,
			auto_insert_mode = true,
			prompts = {
				Explain = {
					prompt = 'Explain the selected code in detail.',
					system_prompt = 'You are a helpful coding assistant with expertise in multiple programming languages.',
					description = 'Detailed explanation of code.',
				},
				Fix = {
					prompt = 'Identify problems in the selected code, provide fixes, and explain the changes.',
					system_prompt = 'You are a coding assistant specialized in finding bugs and suggesting improvements for code in various languages.',
					description = 'Finds issues and fixes code.',
				},
			},
			selection = function(source)
				local select = require('CopilotChat.select')
				return select.visual(source) or select.line(source) or select.buffer(source) -- Fallback auf Buffer
			end,
		},
		config = function(_, opts)
			require("CopilotChat").setup(opts)
			-- Buffer appearance for chat
			vim.api.nvim_create_autocmd('BufEnter', {
				pattern = 'copilot-*',
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})
			-- Highlights mit dynamischen Farben
			vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true })
			vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#374151' })
			vim.api.nvim_set_hl(0, 'CopilotChatKeyword', { fg = '#10B981', italic = true })
		end,
	},
}