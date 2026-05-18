local M = {}

local function read_file(path)
	local f = io.open(path, "r")
	if not f then return "" end
	local content = f:read("*a")
	f:close()
	return content:gsub("%s+$", "")
end

M.hostname = read_file("/etc/hostname")

M.is_desktop = M.hostname == "addiGoat-Desktop"
M.is_laptop = M.hostname == "archLaptop-addi"

return M
