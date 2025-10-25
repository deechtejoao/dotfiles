local opt = vim.opt

-- Display
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
vim.cmd("colorscheme wildcharm")
vim.loader.enable()

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Behavior
opt.wrap = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.scrolloff = 8

-- Files
opt.backup = false
opt.swapfile = false
opt.undofile = true

-- Keymaps

-- Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Clear serch highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")



-- Splits
keymap("n", "<leader>sv", "<C-w>v", opts)           -- Split vertically
keymap("n", "<leader>sh", "<C-w>s", opts)           -- Split horizontally
keymap("n", "<leader>se", "<C-w>=", opts)           -- Equal split sizes
keymap("n", "<leader>sx", "<cmd>close<CR>", opts)   -- Close current split

-- Tabs
keymap("n", "<leader>tn", "<cmd>tabnew<CR>", opts)       -- New tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", opts)     -- Close tab
keymap("n", "<leader>to", "<cmd>tabonly<CR>", opts)      -- Close all other tabs

keymap("n", "<Tab>", "<cmd>tabnext<CR>", opts)           -- Next tab
keymap("n", "<S-Tab>", "<cmd>tabprevious<CR>", opts)     -- Previous tab

-- Terminal
keymap("n", "<leader>th", "<cmd>split | terminal<CR>", opts)   -- Horizontal terminal
keymap("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", opts)  -- Vertical terminal
keymap("n", "<leader>tt", "<cmd>tabnew | terminal<CR>", opts)  -- Terminal in new tab


-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10
opt.pumblend = 10
opt.complete = ".,w,b,u,t,i"
opt.shortmess:append("c")

-- Wildmenu
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignorecase = true

-- Path settings
opt.path:append("**")
opt.wildignore:append({"*/.git/*", "*/dist/*", "*.swp", "*.pyc" })

-- Tab navigation in completion menu
keymap("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

keymap("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

-- Enter to confirm
keymap("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true })

-- Escape to close menu
keymap("i", "<Esc>", function()
  return vim.fn.pumvisible() == 1 and "<C-e><Esc>" or "<Esc>"
end, { expr = true })

-- Manual completion triggers
keymap("i", "<C-Space>", "<C-x><C-o>")  -- Omni
keymap("i", "<C-f>", "<C-x><C-f>")      -- File path
keymap("i", "<C-l>", "<C-x><C-l>")      -- Line

-- Close preview window after completion
vim.api.nvim_create_autocmd("CompleteDone", {
  pattern = "*",
  command = "pclose"
})

-- Common abbreviations
vim.cmd("iabbrev fn function")
vim.cmd("iabbrev ret return")
vim.cmd("iabbrev cl console.log")
