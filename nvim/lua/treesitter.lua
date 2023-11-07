-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
    -- Enable Rainbow Parentheses
  rainbow = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "c",
    "cpp",
    "bash",
    "json",
    "javascript",
    "typescript",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "bash",
    "lua",
    "vim",
    "lua"
  },
  -- auto install above language parsers
  auto_install = true,
})

