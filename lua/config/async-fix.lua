-- Fix for refactoring.nvim / nvim 0.12 module resolution
package.preload["async"] = function()
    return require("plenary.async")
end
