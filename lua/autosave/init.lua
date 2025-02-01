local M = {}

-- プラグインの設定を格納する変数
M.config = {
	save_interval = 500, -- 自動保存の間隔
}

-- 設定を変更する関数
function M.setup(opts)
	M.config = vim.tbl_extend("force", M.config, opts or {})

	-- insert modeを抜けた時時に保存
	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			M.auto_save()
		end,
	})

	-- normal modeで保存
	vim.api.nvim_create_autocmd("CursorHold", {
		callback = function()
			M.auto_save()
		end,
	})
end

-- 自動保存のロジック
function M.auto_save()
	-- ファイルが変更されている場合のみ保存
	if vim.bo.modified then
		-- 既存のタイマーをキャンセル（リセット）
		if save_timer then
			save_timer:stop()
			save_timer = nil
		end

		-- 指定のインターバル後に保存
		save_timer = vim.defer_fn(function()
			if vim.bo.modified then
				vim.cmd("silent! write") -- ファイルを保存
				vim.notify("👊 File auto-saved!", vim.log.levels.INFO) -- 通知
			end
		end, M.config.save_interval)
	end
end

return M
