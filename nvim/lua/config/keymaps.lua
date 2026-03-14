-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
-- desc can be retrieved by the which-key plugin
vim.keymap.set("i", "jj", "<ESC>", { silent = true, desc = "Exit the insert mode" })
-- Use which-key.add instead of vim.keymap.set, due to which-key: dynamic window mappings under leader-w (66bba78)
-- https://github.com/LazyVim/LazyVim/commit/66bba787b83afdd85b5ee95aa589fbe9fbb95535#diff-7cca712fe17a323d19a68b2ea48416807d822df291c4d811466e01bd398b0278
-- vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, noremap = true, desc = "Save" })

vim.keymap.set("n", "<leader>cpp", ":CpPath<CR>", { desc = "Copy relative path" })

-- Mobile Development keymaps (<leader>m prefix)
-- iOS
vim.keymap.set("n", "<leader>mib", function()
  vim.cmd("!xcodebuild -scheme $(xcodebuild -list -json 2>/dev/null | python3 -c \"import sys,json;print(json.load(sys.stdin)['project']['schemes'][0])\") -sdk iphonesimulator build 2>&1 | tail -5")
end, { desc = "iOS: Build" })

vim.keymap.set("n", "<leader>mir", function()
  vim.cmd("!xcrun simctl boot 'iPhone 16' 2>/dev/null; open -a Simulator")
end, { desc = "iOS: Run Simulator" })

vim.keymap.set("n", "<leader>mil", function()
  vim.cmd("split | terminal xcrun simctl spawn booted log stream --style compact --predicate 'subsystem != \"com.apple.runningboard\"'")
end, { desc = "iOS: Stream Logs" })

-- Android
vim.keymap.set("n", "<leader>mab", function()
  vim.cmd("!./gradlew assembleDebug 2>&1 | tail -10")
end, { desc = "Android: Build Debug" })

vim.keymap.set("n", "<leader>mai", function()
  vim.cmd("!adb install -r app/build/outputs/apk/debug/app-debug.apk")
end, { desc = "Android: Install APK" })

vim.keymap.set("n", "<leader>mal", function()
  vim.cmd("split | terminal adb logcat --format=color -v brief")
end, { desc = "Android: Logcat" })

vim.keymap.set("n", "<leader>mas", function()
  vim.cmd("!scrcpy --max-size 1024 &")
end, { desc = "Android: Screen Mirror" })
