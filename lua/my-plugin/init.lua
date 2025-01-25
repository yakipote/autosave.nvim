-- my-plugin/init.lua
local M = {}

-- プラグインの設定を格納する変数
M.config = {
	option1 = true,
	option2 = "default",
}

-- 設定を変更する関数
function M.setup(opts)
	M.config = vim.tbl_extend("force", M.config, opts or {})
	print("My Plugin Loaded with option2: " .. M.config.option2)
end

-- 何かしらの便利な関数
function M.hello()
	print("Hello from My Plugin!")
	print(M.config.option2)
end

-- コマンドとかkeymapの設定これってuser側で書かせたほうがいいのかもしれない
vim.api.nvim_create_user_command("MyPluginHello", function()
	require("my-plugin").hello()
end, {})

vim.api.nvim_set_keymap("n", "<leader>h", ":MyPluginHello<CR>", { noremap = true, silent = true })

return M
