# fcitx5-im-toggle.nvim

A minimal Neovim plugin to automatically toggle `fcitx5` input method:

- When entering insert mode: restores previous IME state (e.g. Chinese)
- When leaving insert mode: switches to English input (`fcitx5-remote -c`)

## Requirements

- `fcitx5`
- `fcitx5-remote` in PATH

## Installation (with lazy.nvim)

```lua
{
  "yourgithubname/fcitx5-im-toggle.nvim",
  config = function()
    require("fcitx5_im_toggle").setup()
  end
}

