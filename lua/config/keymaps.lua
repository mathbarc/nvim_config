-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap
map.del("n", "<leader>gg")
map.del("n", "<leader>gG")
map.del("n", "<leader>gl")
map.del("n", "<leader>gL")
map.del("n", "<leader>gf")

map.set("n","<leader>mb", ":CMakeBuild<CR>")
map.set("n","<leader>mg", ":CMakeGenerate<CR>")
map.set("n","<leader>md", ":CMakeDebug<CR>")
map.set("n","<leader>ms", ":CMakeSelectBuildType<CR>")
