---@toc tex2uni

---@mod tex2uni.init Introduction

---@brief [[
--- tex2uni.nvim provides TeX-to-unicode conversion
---@brief ]]

---@tag tex2uni.nvim

local tex2uni = {}

---Setup function to be run in your init.lua.
---@param opts tex2uni.Config Configuration options
function tex2uni.setup(opts)
	opts = opts or {}

	opts.abbreviations = opts.abbreviations or {}
	if opts.abbreviations.enable ~= false then
		require("tex2uni.abbreviations").enable(opts.ft, opts.abbreviations)
	end

	vim.g.tex2uni_config = opts
end

---Try to find what version of `lean.nvim` this is.
---
---@return string|nil version
function tex2uni.plugin_version() end

---Enable mappings for a given buffer
---@param bufnr? number the bufnr to enable mappings in, defaulting to 0
function tex2uni.use_suggested_mappings(bufnr)
	local opts = { buffer = bufnr or 0 }
	for _, each in ipairs(tex2uni.mappings) do
		local lhs, rhs, more_opts = unpack(each)
		vim.keymap.set(each.mode or "n", lhs, rhs, vim.tbl_extend("error", opts, more_opts))
	end
end

return tex2uni
