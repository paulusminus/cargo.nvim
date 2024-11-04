local options = {}

local cargo = {}

local function is_rust_project()
	local cwd = vim.fn.getcwd()
	local toml_file = vim.fs.joinpath(cwd, "Cargo.toml")
	local f = io.open(toml_file, "r")
	if f then
		io.close(f)
		return true
	else
		return false
	end
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
