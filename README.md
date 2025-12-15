<div align="center">
      <h1> <img src="https://i.postimg.cc/HkJsD67j/dotenv.png" width="80px"><br/>dotenv.nvim</h1>
     </div>
<p align="center"> 
      <a href="https://twitter.com/intent/user?screen_name=ellisonleao" target="_blank"><img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/ellisonleao?style=for-the-badge" style="vertical-align:center" ></a>
      <a href="#"><img alt="Made with Lua" src="https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua" style="vertical-align:center" /></a>
</p>

A minimalist .env support for Neovim (WIP)

# Prerequisites

Neovim 0.7.0+

# Installing

Using `packer`

```lua
use { "sameert89/dotenv.nvim" }
```

Using `Lazy`

```lua
{ "sameert89/dotenv.nvim" }
```

# Basic Usage

```lua
require('dotenv').setup()
```

# Configuration

Additional settings are:

```lua
require('dotenv').setup({
  enable_on_load = true, -- will load your .env file upon loading a buffer
  verbose = false, -- show error notification if .env file is not found and if .env is loaded
  path = 'myenvfile.env' -- by default it looks for a .env file in the config directory
})
```

# Usage

This populates the standard vim.env[] table, you can access an env variable by vim.env["KEY_NAME"]
