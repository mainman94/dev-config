-- ========================================
-- 🤖 Copilot & CopilotChat Configuration
-- ========================================

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = 'gpt-4.1',
      temperature = 0.1,
      window = {
        layout = 'float',
        width = 80,
        height = 20,
        border = 'rounded',
        title = '🤖 AI Assistant',
        zindex = 100,
      },
      headers = {
        user = '👤 You: ',
        assistant = '🤖 Copilot: ',
        tool = '🔧 Tool: ',
      },
      separator = '━━',
      show_folds = false,
      auto_insert_mode = true,
      -- Example: custom prompt
      prompts = {
        Explain = {
          prompt = 'Explain the selected code.',
          system_prompt = 'You are a helpful coding assistant.',
          description = 'Detailed explanation of code.',
        },
        Fix = {
          prompt = 'Identify problems and rewrite the selected code with fixes and explanation.',
          system_prompt = 'You are a coding assistant that finds bugs and suggests improvements.',
          description = 'Finds issues and fixes code.',
        },
      },
      -- Example: selection behavior
      selection = function(source)
        return require('CopilotChat.select').visual(source)
          or require('CopilotChat.select').line(source)
      end,
    },
    config = function()
      -- Buffer appearance for chat
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
          vim.opt_local.conceallevel = 0
        end,
      })
      -- Optional: highlights
      vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true })
      vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#374151' })
      vim.api.nvim_set_hl(0, 'CopilotChatKeyword', { fg = '#10B981', italic = true })
    end,
  },
}
