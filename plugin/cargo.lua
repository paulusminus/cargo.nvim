if 1 ~= vim.fn.has("nvim-0.9.0") then
	vim.api.nvim_err_writeln("cargo.nvim requires at least nvim-0.9.0.")
	return
end

vim.api.nvim_create_user_command("CargoDocTest", function()
	require("cargo").test_doc()
end, {})
vim.api.nvim_create_user_command("CargoRunRelease", function()
	require("cargo").run_release()
end, {})
