local function compile()
    local default = vim.b.compile_command or vim.bo.makeprg

    local command = vim.fn.input({
        prompt = "Compile command: ",
        default = default,
        completion = "shellcmd",
    })

    if command == "" then
        return
    end

    vim.b.compile_command = command
    vim.bo.makeprg = command

    vim.cmd("make!")

    if #vim.fn.getqflist() > 0 then
        vim.cmd("copen")
    end
end

vim.api.nvim_create_user_command("Compile", compile, {})

vim.keymap.set('n', '<leader>cc', '<cmd>Compile<CR>', { desc = 'Run my compile command workflow' } )
