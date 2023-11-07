-- define your colorscheme here
local colorscheme = 'monokai_soda'

pcall(vim.cmd, "colorscheme " .. colorscheme)
-- Remove the background color
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi LineNr guibg=NONE ctermbg=NONE')







