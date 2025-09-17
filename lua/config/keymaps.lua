-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

map.set("n", "<leader>cc", "", { desc = "CMake Tools" })
map.set("n", "<leader>ccg", "<cmd>CMakeGenerate<CR>", { desc = "Generate CMake Build Configuration" })
map.set("n", "<leader>ccs", "<cmd>CMakeSelectBuildType<CR>", { desc = "Select CMake Build Type" })
map.set("n", "<leader>ccm", "<cmd>CMakeBuild<CR>", { desc = "Build CMake Project" })
map.set("n", "<leader>cct", "<cmd>CMakeSelectLaunchTarget<CR>", { desc = "Select Target for execution" })
map.set("n", "<leader>ccr", "<cmd>CMakeRun<CR>", { desc = "Run Target" })
map.set("n", "<leader>ccd", "<cmd>CMakeDebug<CR>", { desc = "Debug CMake Project" })
map.set("n", "<leader>cce", "<cmd>CMakeRunTest<CR>", { desc = "Run Tests" })
map.set("n", "<leader>ccc", "<cmd>CMakeClean<CR>", { desc = "Clean" })
map.set("n", "<leader>ccv", "<cmd>!cmake-gui build<CR>", { desc = "Show GUI" })
map.set("n", "<leader>m", "", { desc = "Make" })
map.set("n", "<leader>mm", "<cmd>!make<CR>", { desc = "Make" })
map.set("n", "<leader>mb", "<cmd>!make build<CR>", { desc = "Make Build" })
map.set("n", "<leader>mc", "<cmd>!make clean<CR>", { desc = "Make Clean" })

map.set("n", "<leader>ccf", "", { desc = "Code format" })
map.set(
    "n",
    "<leader>ccfc",
    "<cmd>!cp ~/.config/nvim/resource/.clang-format ./<CR>",
    { desc = "Copy reference clang-format file" }
)
map.set(
    "n",
    "<leader>ccfa",
    "<cmd>!bash ~/.config/nvim/scripts/clang-format-all.sh ./<CR>",
    { desc = "Apply code format into current folder" }
)
