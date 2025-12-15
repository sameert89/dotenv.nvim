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

- No `setup()` call is needed.

# Usage

```lua
local dotenv = require("dotenv")
dotenv.get("KEY_NAME")
```
