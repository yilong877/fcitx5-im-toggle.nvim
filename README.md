# fcitx5-im-toggle.nvim

## Up front

只是为了方便自己使用。

## Introduction

A minimal Neovim plugin to automatically toggle `fcitx5` input method:

- When entering insert mode: restores previous IME state (e.g. Chinese)
- When leaving insert mode: switches to English input (`fcitx5-remote -c`)

## Requirements

- `fcitx5`
- `fcitx5-remote` in PATH

## Installation (with lazy.nvim)

```lua
{
  "yilong877/fcitx5-im-toggle.nvim",
  config = function()
    require("fcitx5-im-toggle").setup()
  end
}

