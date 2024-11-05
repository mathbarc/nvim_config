-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

map.set("n", "<leader>cc", "", { desc = "CMake Tools" })
map.set("n", "<leader>ccm", "<cmd>CMakeBuild<CR>", { desc = "Build CMake Project" })
map.set("n", "<leader>ccg", "<cmd>CMakeGenerate<CR>", { desc = "Generate CMake Build Configuration" })
map.set("n", "<leader>ccd", "<cmd>CMakeDebug<CR>", { desc = "Debug CMake Project" })
map.set("n", "<leader>ccs", "<cmd>CMakeSelectBuildType<CR>", { desc = "Select CMake Build Type" })
