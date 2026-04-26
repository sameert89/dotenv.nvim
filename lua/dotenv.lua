---@diagnostic disable: missing-parameter
local uv = vim.loop

local dotenv = {}

dotenv.config = {
  event = "VimEnter",
  enable_on_load = true,
  verbose = true,
  file_name = ".env",
}

local function notify(msg, level)
  if not dotenv.config.verbose then
    return
  end

  level = level or "INFO"
  vim.notify(msg, vim.log.levels[level])
end

local function read_file(file_name)
  local fd = assert(uv.fs_open(file_name, "r", 438))
  local stat = assert(uv.fs_fstat(fd))
  local data = assert(uv.fs_read(fd, stat.size, 0))
  assert(uv.fs_close(fd))
  return data
end

local function parse_data(data)
  local values = vim.split(data, "\n")
  local out = {}

  for _, line in ipairs(values) do
    line = vim.trim(line)

    if line ~= "" and not vim.startswith(line, "#") then
      local key, value = line:match("^%s*([^=]+)%s*=%s*(.*)%s*$")

      if key and value then
        key = vim.trim(key)

        -- remove surrounding quotes only
        value = vim.trim(value)
        value = value:gsub('^"(.*)"$', "%1")
        value = value:gsub("^'(.*)'$", "%1")

        vim.env[key] = value
        out[key] = value
      end
    end
  end

  return out
end

local function get_env_file()
  local files = vim.fs.find(dotenv.config.file_name, {
    upward = true,
    type = "file",
    path = vim.fn.stdpath("config"),
  })

  if #files == 0 then
    return nil
  end

  return files[1]
end

local function load()
  local file = get_env_file()

  if file == nil then
    notify(".env file not found", "ERROR")
    return
  end

  local ok, data = pcall(read_file, file)
  if not ok then
    notify("failed to read .env file: " .. tostring(data), "ERROR")
    return
  end

  parse_data(data)
  notify(".env file loaded: " .. file)
end

dotenv.load = load

dotenv.get = function(key)
  local var = string.upper(key)

  if vim.env[var] == nil then
    notify(var .. ": not found", "WARN")
    return ""
  end

  return vim.env[var]
end

if dotenv.config.enable_on_load then
  vim.api.nvim_create_autocmd(dotenv.config.event, {
    once = true,
    callback = load,
  })
end

return dotenv
