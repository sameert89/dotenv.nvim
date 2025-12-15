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
