return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      local function read_launch_profiles()
        local profiles = {}
        local files = vim.fs.find("launchSettings.json", {
          path = vim.fn.getcwd(),
          type = "file",
          limit = math.huge,
        })

        for _, file in ipairs(files) do
          local contents = table.concat(vim.fn.readfile(file), "\n")
          local ok, settings = pcall(vim.json.decode, contents)

          if ok and settings.profiles then
            local project_dir = vim.fs.dirname(vim.fs.dirname(file))

            for name, profile in pairs(settings.profiles) do
              if profile.commandName == "Project" then
                table.insert(profiles, {
                  name = name,
                  project_dir = project_dir,
                  display = name .. "  [" .. project_dir .. "]",
                })
              end
            end
          end
        end

        table.sort(profiles, function(a, b)
          return a.display < b.display
        end)

        return profiles
      end

      local function launch_dotnet_profile()
        local profiles = read_launch_profiles()
        if #profiles == 0 then
          vim.notify("No valid Project profiles found in launchSettings.json", vim.log.levels.WARN)
          return
        end

        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values
        local actions = require "telescope.actions"
        local action_state = require "telescope.actions.state"
        pickers
          .new({}, {
            prompt_title = ".NET project",
            finder = finders.new_table {
              results = profiles,
              entry_maker = function(item)
                return {
                  value = item,
                  display = item.display,
                  ordinal = item.display,
                }
              end,
            },
            sorter = conf.generic_sorter {},
            attach_mappings = function(_, map)
              actions.select_default:replace(function(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                if not entry then
                  return
                end

                actions.close(prompt_bufnr)

                vim.cmd "botright 20new"
                local terminal_buf = vim.api.nvim_get_current_buf()
                vim.bo[terminal_buf].buflisted = false
                vim.bo[terminal_buf].swapfile = false
                local command
                if vim.fn.has "win32" == 1 then
                  command = { "cmd.exe", "/d", "/s", "/c", "dotnet build && dotnet clean" }
                else
                  command = { "sh", "-c", "dotnet build && dotnet clean" }
                end

                vim.fn.termopen(command, {
                  cwd = entry.value.project_dir,
                })
                vim.cmd "startinsert"
              end)

              map("i", "<C-c>", actions.close)
              return true
            end,
          })
          :find()
      end

      vim.api.nvim_create_user_command("DotnetLaunchProfile", launch_dotnet_profile, {})
      vim.keymap.set("n", "<leader>dp", launch_dotnet_profile, {
        desc = "[d]otnet: Select [p]roject and build/clean",
      })
    end,
  },
}
