---@mod tex2uni.config Configuration

---@brief [[
--- Configuration of tex2uni.nvim.
---@brief ]]

---@class tex2uni.Config
---@field mappings? boolean whether to automatically enable key mappings
---@field abbreviations? tex2uni.abbreviations.Config abbreviaton configuration
---@field ft string[] what filetype should abbreviations be enabled in

---@class tex2uni.MergedConfig: tex2uni.Config

---@class tex2uni.abbreviations.Config
---@field enable? boolean whether to automatically enable expansion
---@field leader? string which key to use to trigger abbreviation expansion
---@field distributor? string which key to use to distribute
---@field extra table<string, string> a table of extra abbreviations to enable

---@type tex2uni.MergedConfig
local DEFAULTS = {
	mappings = false,

	---@type tex2uni.abbreviations.Config
	abbreviations = {
		leader = "\\",
		distributor = "\#",
		extra = {},
	},

	ft = {},
}

---Load our merged configuration merging user configuration with any defaults.
---@return tex2uni.MergedConfig
return function()
	---@type tex2uni.Config
	vim.g.tex2uni_config = vim.g.tex2uni_config or {}
	return vim.tbl_deep_extend("keep", vim.g.tex2uni_config, DEFAULTS)
end
