local function load_template(path)
    local file = io.open(path, "r")
    if not file then
        return
    end

    local contents = file:read("*a")
    file:close()

    local lines = vim.split(contents, "\n")

    vim.api.nvim_buf_set_lines(
        0,      -- current buffer
        0,      -- start line
        -1,     -- through end of buffer
        false,  -- strict indexing
        lines
    )
end

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "main.cpp",
    callback = function()
        load_template(vim.fn.expand("~/.local/share/templates/cpp-main.cpp"))
    end,
})
