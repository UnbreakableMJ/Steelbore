-- STEELBORE NEOVIM IDENTITY
if vim.g.neovide then
    -- Set official Steelbore Font
    vim.o.guifont = "JetBrainsMono Nerd Font:h12"
    
    -- Custom Steelbore Palette Overrides
    vim.api.nvim_set_hl(0, 'Normal', { fg = '#C0C0C0', bg = '#0E141D' })
    vim.api.nvim_set_hl(0, 'Cursor', { fg = '#0E141D', bg = '#FE6B00' })
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#142E46' })
    
    -- Smooth Scrolling (Industrial Feel)
    vim.g.neovide_scroll_animation_length = 0.3
end

-- Enforce Vim-mode (Standard across all 10 Steelbore editors)
vim.o.mouse = 'a'
vim.wo.number = true
vim.wo.relativenumber = true
