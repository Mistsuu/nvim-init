-- Shoutout to https://github.com/bibjaw99/workstation/blob/master/config_dotfiles/config/nvim/lua/grimmvim/plugins/ui/noice.lua

-- function for simplifying the views options
local function getviews()
	local views = {}
	local all_views = {
		"notify",
		"split",
		"vsplit",
		"popup",
		"mini",
		"cmdline",
		"cmdline_popup",
		"cmdline_output",
		"messages",
		"confirm",
		"hover",
		"popupmenu",
	}
	for _, view in ipairs(all_views) do
		-- disable the scrollbar for all views
		views[view] = { scrollbar = false }
	end
	-- extra options
	views["split"].enter = true
	return views
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "rcarriga/nvim-notify",
  },
	opts = {
		views = getviews(),
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
			},
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
		},
		routes = {
			{
				filter = {
					any = {
						{
							event = { "notify", "msg_show" },
							find = "No information available",
						},
						{
							event = { "notify", "msg_show" },
							find = "minifiles is not supported",
						},
						{
							event = "msg_show",
							kind = "",
							find = "written",
						},
					},
				},
				opts = {
					skip = true,
				},
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
      inc_rename = false,
			lsp_doc_border = true,
		},
	},
	config = function(_, opts)
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end
		require("noice").setup(opts)
	end,
}

