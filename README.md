
# install

```json
return {
  "yakipote/my-plugin.nvim",
  lazy = false,
  config = function()
    require("my-plugin").setup({
      option2 = "lazy.nvim最高！"
    })
  end
}
```
