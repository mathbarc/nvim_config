-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap
map.del("n", "<leader>gg")
map.del("n", "<leader>gG")
map.del("n", "<leader>gl")
map.del("n", "<leader>gL")
map.del("n", "<leader>gf")



map.set("n","<leader>cc", "", {desc="CMake Tools"})
map.set("n","<leader>ccb", ":CMakeBuild<CR>", {desc="Build CMake Project"})
map.set("n","<leader>ccg", ":CMakeGenerate<CR>", {desc="Generate CMake Build Configuration"})
map.set("n","<leader>ccd", ":CMakeDebug<CR>", {desc="Debug CMake Project"})
map.set("n","<leader>ccs", ":CMakeSelectBuildType<CR>", {desc="Select CMake Build Type"})
