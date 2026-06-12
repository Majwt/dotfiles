-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- disable arrow keys to encourage using hjkl
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>", { desc = "Disable arrow up" })
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>", { desc = "Disable arrow down" })
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>", { desc = "Disable arrow left" })
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>", { desc = "Disable arrow right" })

vim.keymap.set("n", "<leader>ae", "<cmd>Copilot toggle<cr>", { desc = "Toggle Copilot" })

local last_js_css_source = nil

local function switch_js_css()
  local current = vim.fn.expand("%:p")
  local dir = vim.fn.expand("%:p:h")
  local name = vim.fn.expand("%:t:r")
  local ext = vim.fn.expand("%:e")
  local root = vim.fn.getcwd()

  local source_exts = { "js", "jsx", "ts", "tsx" }

  local targets = {}

  if ext == "css" then
    if last_js_css_source and vim.fn.filereadable(last_js_css_source) == 1 then
      vim.cmd.edit(vim.fn.fnameescape(last_js_css_source))
      return
    end

    targets = {
      dir .. "/" .. name .. ".tsx",
      dir .. "/" .. name .. ".ts",
      dir .. "/" .. name .. ".jsx",
      dir .. "/" .. name .. ".js",
      dir .. "/App.tsx",
      dir .. "/App.ts",
      dir .. "/App.jsx",
      dir .. "/App.js",
      dir .. "/main.tsx",
      dir .. "/main.ts",
      dir .. "/main.jsx",
      dir .. "/main.js",
      dir .. "/index.tsx",
      dir .. "/index.ts",
      dir .. "/index.jsx",
      dir .. "/index.js",
    }
  elseif vim.tbl_contains(source_exts, ext) then
    last_js_css_source = current

    targets = {
      dir .. "/" .. name .. ".css",
      dir .. "/" .. name .. ".module.css",
      dir .. "/App.css",
      dir .. "/app.css",
      dir .. "/index.css",
      root .. "/src/App.css",
      root .. "/src/app.css",
      root .. "/src/index.css",
      root .. "/App.css",
      root .. "/app.css",
      root .. "/index.css",
    }
  else
    vim.notify("Not a JS/TS/JSX/TSX/CSS file", vim.log.levels.WARN)
    return
  end

  for _, file in ipairs(targets) do
    if vim.fn.filereadable(file) == 1 then
      vim.cmd.edit(vim.fn.fnameescape(file))
      return
    end
  end

  vim.notify("No matching file found", vim.log.levels.WARN)
end

if vim.fn.maparg("<leader>ch", "n") == "" then
  vim.keymap.set("n", "<leader>ch", switch_js_css, {
    desc = "Switch source/CSS",
  })
end
