# install

```json
return {
  "yakipote/autosave.nvim",
  lazy = false,
  config = function()
    require("autosave").setup({
      save_interval = 1000
    })
  end
}
```
