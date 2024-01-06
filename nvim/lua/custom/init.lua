local opt = vim.opt
local global = vim.g
local autocmd = vim.api.nvim_create_autocmd
local create_cmd = vim.api.nvim_create_user_command

---------------------------------------- OPTIONS ----------------------------------------
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.wrap = false
opt.smarttab = true
opt.termguicolors = true
opt.guifont = { "JetBrainsMono Nerd Font:h14" }
opt.foldcolumn = "1"
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.laststatus = 3
opt.mousemoveevent = true
opt.timeoutlen = 400
opt.scrolloff = 4
opt.sidescrolloff = 400
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noselect" }
opt.autochdir = true
opt.splitbelow = true
opt.splitright = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.cmdheight = 0
opt.pumheight = 10
opt.showmode = false
opt.showcmd = false
opt.undofile = true
opt.updatetime = 250
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
opt.cursorline = true
opt.shiftround = true

vim.cmd [[let g:python3_host_prog = "/usr/bin/python"]]

vim.diagnostic.config {
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    float = { border = "rounded" },
    severity_sort = false,
}

---------------------------------------- GLOBALS ----------------------------------------
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    global.airline_powerline_fonts = 1
    global.neovide_cursor_antialiasing = true
    global.neovide_window_floating_opacity = 1
    global.neovide_no_idle = true
    global.neovide_cursor_animation_length = 0.05
    global.neovide_cursor_animate_in_insert_mode = true
    global.neovide_cursor_animate_command_line = true
    global.neovide_hide_mouse_when_typing = true
    global.neovide_confirm_quit = true

    global.neovide_cursor_unfocused_outline_width = 0.125
    global.neovide_cursor_vfx_particle_lifetime = 1.2

    global.neovide_refresh_rate = 60
    global.neovide_cursor_vfx_particle_curl = 1.0
    global.neovide_cursor_vfx_particle_density = 7.0
    global.neovide_cursor_vfx_particle_speed = 10.0
    global.neovide_cursor_vfx_particle_phase = 1.5
    global.neovide_cursor_vfx_mode = "railgun"

    global.neovide_padding_top = 0
    global.neovide_padding_bottom = 0
    global.neovide_padding_left = 0
    global.neovide_padding_right = 0

    global.neovide_transparency = 1
    global.neovide_fullscreen = false
    global.neovide_remember_window_size = true
    global.neovide_profiler = false
end

-------------------------------------- AUTOCMD --------------------------------------
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
    pattern = "*",
    command = "tabdo wincmd =",
})

-- Restore cursor position
autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"', false)
    end,
})

-- Update Remote Plugins to make wilder.nvim work
local UpdatePlugs = vim.api.nvim_create_augroup("UpdateRemotePlugs", {})
autocmd({ "VimEnter", "VimLeave" }, {
    pattern = "*",
    group = UpdatePlugs,
    command = "runtime! plugin/rplugin.vim",
})

autocmd({ "VimEnter", "VimLeave" }, {
    pattern = "*",
    group = UpdatePlugs,
    command = "silent! UpdateRemotePlugins",
})

-- Auto close NvimTree
autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
    pattern = "NvimTree_*",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if
            layout[1] == "leaf"
            and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
            and layout[3] == nil
        then
            vim.cmd "confirm quit"
        end
    end,
})

-- Others
vim.cmd [[
    augroup _general_settings
        autocmd!
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
		autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
		autocmd BufWinEnter * :set formatoptions-=cro
		autocmd FileType qf set nobuflisted
	augroup end

    augroup _alpha
    	autocmd!
    	autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
        autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
  	augroup end

    augroup _floaterm_mappings
        autocmd!
        autocmd FileType javascrpit nnoremap <silent> <buffer> <F5> :w<Esc>:FloatermNew --autoclose=0 node % <CR>
        autocmd FileType python nnoremap <silent> <buffer> <F5> :w<Esc>:FloatermNew --autoclose=0 python3 % <CR>
        autocmd FileType c nnoremap <silent> <buffer> <F5> :w<Esc>:FloatermNew --autoclose=0 gcc % -o %< && ./%< <CR>
        autocmd FileType cpp nnoremap <silent> <buffer> <F5> :w<Esc>:FloatermNew --autoclose=0 g+ % -o %< && ./%< <CR>
    augroup end

    augroup cproject
        autocmd!
        autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
    augroup end
]]

-------------------------------------- COMMANDS -------------------------------------
create_cmd("EnableAutoSave", function()
    require("autosave").setup()
end, {})

create_cmd("EnableShade", function()
    require("shade").setup()
end, {})

create_cmd("FAR", function()
    require("custom.configs.far").findInput()
end, {})

create_cmd("SearchIssue", function()
    require("custom.configs.research").MenuBrowser()
end, {})
