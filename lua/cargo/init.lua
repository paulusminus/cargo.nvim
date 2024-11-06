local options = {}

local cargo = {}

local function is_rust_project()
	return vim.fn.filereadable(vim.fs.joinpath(vim.fs.getcwd(), "Cargo.toml"))
end

cargo.run_release = function()
	if is_rust_project() then
		vim.cmd("edit term://cargo run --release")
	end
end

cargo.test_doc = function()
	if is_rust_project() then
		vim.cmd("edit term://cargo test --doc")
	end
end

---@param opts table: Options to configure cargo module
cargo.setup = function(opts)
	opts = opts or {}
	for k, v in pairs(opts) do
		options[k] = v
	end
end

return cargo
