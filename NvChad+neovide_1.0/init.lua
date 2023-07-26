require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

--------------- NeoVide -----------------
--
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    --
    -- Helper function for transparency formatting
    local alpha = function()
      return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
    end

    vim.o.guifont = "JetBrainsMono Nerd Font:h17" -- text below applies for VimScript
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_transparency = 0.0
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#0f1117" .. alpha() 
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_vfx_mode = "sonicboom"
    vim.g.neovide_cursor_trail_size = 0.8

    -- disable the fucking warning 
    vim.notify = filter_notify
    local notify = vim.notify
    vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

        notify(msg, ...)
    end 

    -- enable copilot (dont know why have to do this)
      vim.g.copilot_assume_mapped = true

    -- my options
    vim.opt.shiftwidth = 4
    vim.cmd[[colorscheme gruvbox]]
    vim.cmd[[set background=dark]]

    vim.cmd[[set nocursorline]]

    vim.cmd('highlight! link Identifier GruvboxFg2')
    vim.cmd('highlight! link Operator GruvboxFg0')
    vim.cmd('highlight! link Function GruvboxFg0')
end

