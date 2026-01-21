-- Misc
vim.opt.clipboard = "unnamed,unnamedplus"
vim.g.mapleader = " "
vim.cmd(':colorscheme desert')

vim.cmd('set number')
-- vim.cmd(':set nohlsearch')
vim.cmd('set cindent shiftwidth=4')

-- Useful keymaps
-- TODO: Could be useful, D by default is C-k on emacs
vim.keymap.set('v', '<A-d>', 'yd')

vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')

vim.keymap.set('n', '<A-j>', ":move +1<CR>", { desc = "Move line down"})
vim.keymap.set('n', '<A-k>', ":move -2<CR>", { desc = "Move line up"})
vim.keymap.set('i', '<A-j>', "<Esc>:move +1<CR><i>", { desc = "Move line down"})
vim.keymap.set('i', '<A-k>', "<Esc>:move -2<CR><i>", { desc = "Move line up"})
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Tabs management
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smarttab")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=0")
vim.cmd("set autoindent")

-- Remove trailing white spaces on save
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('trim_whitespaces', { clear = true }),
    desc = 'Trim trailing white spaces',
    pattern = '*',
    callback = function()
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '<buffer>',
            -- Trim trailing whitespaces
            callback = function()
                -- Save cursor position to restore later
                local curpos = vim.api.nvim_win_get_cursor(0)
                -- Search and replace trailing whitespaces
                vim.cmd([[keeppatterns %s/\s\+$//e]])
                vim.api.nvim_win_set_cursor(0, curpos)
            end,
        })
    end,
})

-- Escape rebind
vim.keymap.set('i', '<C-l>', '<Esc>')
vim.keymap.set('v', '<C-l>', '<Esc>')

-- Buffer management
vim.keymap.set('n', "<leader>n", ":bnext<cr>")
vim.keymap.set('n', "<leader>p", ":bprevious<cr>")
vim.keymap.set('n', "<leader>d", ":bdelete<cr>")

-- Comment lines
-- Toggle comment using vim.bo.commentstring (prefix/suffix)
local function toggleComment()
    -- helpers
    local function trim(s) return (s or ""):match("^%s*(.-)%s*$") end
    local function escape_lua_pattern(s)
        -- escape Lua pattern magic chars
        return s:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
    end

    -- get commentstring and split into prefix/suffix
    local cs = vim.bo.commentstring or "-- %s"
    local prefix, suffix = cs:match("^(.-)%%s(.-)$")
    prefix = trim(prefix or "")
    suffix = trim(suffix or "")

    local mode = vim.fn.mode()
    local block_visual = string.char(22) -- visual-block mode

    -- get range depending on mode
    local start_line, end_line
    if mode == "v" or mode == "V" or mode == block_visual then
        start_line = vim.fn.line("'<")
        end_line = vim.fn.line("'>")
        -- when calling from visual mapping, leave visual selection cleared
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 'n', false)
    else
        start_line = vim.fn.line(".")
        end_line = start_line
    end

    -- check if a line is commented (prefix after indentation, and suffix at end if present)
    local function line_is_commented(line)
        local inner = trim(line)
        if prefix ~= "" then
            if inner:sub(1, #prefix) ~= prefix then
                return false
            end
        end
        if suffix ~= "" then
            if inner:sub(-#suffix) ~= suffix then
                return false
            end
        end
        return true
    end

    -- uncomment a single line (remove prefix after indent, and suffix at end)
    local function uncomment_line(line)
        local p_pat = escape_lua_pattern(prefix)
        local s_pat = escape_lua_pattern(suffix)
        -- remove prefix after indentation
        if prefix ~= "" then
            line = line:gsub("^%s*" .. p_pat .. "%s?", "", 1)
        end
        -- remove suffix at end
        if suffix ~= "" then
            line = line:gsub("%s?" .. s_pat .. "%s*$", "", 1)
        end
        return line
    end

    -- comment a single line (insert prefix after indentation, and optional suffix at end)
    local function comment_line(line)
        local indent = line:match("^(%s*)") or ""
        local body = line:sub(#indent + 1)
        local out = indent .. prefix
        -- add a space between prefix and content for readability (typical commentstring)
        if prefix ~= "" then out = out .. " " end
        out = out .. body
        if suffix ~= "" then out = out .. " " .. suffix end
        return out
    end

    -- MAIN: handle block vs linewise
    if suffix ~= "" and start_line ~= end_line then
        -- prefer block-style wrap/unwrap for multi-line selection when suffix exists
        local first = vim.fn.getline(start_line)
        local last = vim.fn.getline(end_line)
        local first_inner = trim(first)
        local last_inner = trim(last)

        local is_block_commented = false
        if prefix ~= "" and suffix ~= "" then
            if first_inner:sub(1, #prefix) == prefix and last_inner:sub(-#suffix) == suffix then
                is_block_commented = true
            end
        end

        if is_block_commented then
            -- remove prefix from first line (after indent) and suffix from last line
            first = first:gsub("^%s*" .. escape_lua_pattern(prefix) .. "%s?", "", 1)
            last = last:gsub("%s?" .. escape_lua_pattern(suffix) .. "%s*$", "", 1)
            vim.fn.setline(start_line, first)
            vim.fn.setline(end_line, last)
        else
            -- add prefix to first line (respect indent) and suffix to last line
            local indent = first:match("^(%s*)") or ""
            local new_first = indent .. prefix
            if prefix ~= "" then new_first = new_first .. " " end
            new_first = new_first .. first:sub(#indent + 1)
            local new_last = last .. " " .. suffix
            vim.fn.setline(start_line, new_first)
            vim.fn.setline(end_line, new_last)
        end
    else
        -- line-wise toggle (single line or multi-line without suffix)
        -- determine if ALL lines in range are commented
        local all_commented = true
        for ln = start_line, end_line do
            if not line_is_commented(vim.fn.getline(ln)) then
                all_commented = false
                break
            end
        end

        if all_commented then
            -- uncomment all
            for ln = start_line, end_line do
                local l = vim.fn.getline(ln)
                vim.fn.setline(ln, uncomment_line(l))
            end
        else
            -- comment all (for lines not commented yet we still prefix - this keeps it idempotent-ish)
            for ln = start_line, end_line do
                local l = vim.fn.getline(ln)
                -- avoid double-prefixing: if the line is already commented, leave it
                if not line_is_commented(l) then
                    vim.fn.setline(ln, comment_line(l))
                end
            end
        end
    end
end

-- Expose a global for easy mapping
vim.api.nvim_set_keymap('n', "<C-\\>", "", {noremap = true, callback = toggleComment})
vim.api.nvim_set_keymap('i', "<C-\\>", "", {noremap = true, callback = toggleComment})
vim.api.nvim_set_keymap('v', "<C-\\>", "", {noremap = true, callback = toggleComment})
