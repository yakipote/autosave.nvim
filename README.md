
# install

```json
return {
  dir = "yakipote/my_plugin.nvim",  -- プラグインのディレクトリ
  lazy = false,  -- 起動時にロード（`true`にすると必要なときだけ読み込み）
  config = function()
    require("my_plugin").setup({
      option2 = "lazy.nvim最高！"
    })
  end
}
```
