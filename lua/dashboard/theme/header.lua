local api = vim.api
local utils = require('dashboard.utils')

local function week_ascii_text()
  return {
    ['Monday'] = {
      [[                                                                                                   ]],
      [[__/\\\\\_____/\\\_______________________________/\\\________/\\\___________________________        ]],
      [[ _\/\\\\\\___\/\\\______________________________\/\\\_______\/\\\___________________________       ]],
      [[  _\/\\\/\\\__\/\\\______________________________\//\\\______/\\\___/\\\_____________________      ]],
      [[   _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____\//\\\____/\\\___\///_____/\\\\\__/\\\\\___     ]],
      [[    _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\____\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_    ]],
      [[     _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\_   ]],
      [[       _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\_ ]],
      [[        _\///_____\/////____\//////////_____\/////___________\///________\///__\///___\///___\///__]],
      [[                                                                                                   ]],
    },
    ['Tuesday'] = {
      [[=================     ===============     ===============   ========  ========]],
      [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
      [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
      [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
      [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
      [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
      [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
      [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
      [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
      [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
      [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
      [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
      [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
      [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
      [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
      [[||.=='    _-'                                                     `' |  /==.||]],
      [[=='    _-'                        N E O V I M                         \/   `==]],
      [[\   _-'                                                                `-_   /]],
      [[ `''                                                                      ``' ]],
    },
    ['Wednesday'] = {
      [[                                                                    ]],
      [[ _____  ___    _______    ______  ___      ___  __     ___      ___ ]],
      [[(\"   \|"  \  /"     "|  /    " \|"  \    /"  ||" \   |"  \    /"  |]],
      [[|.\\   \    |(: ______) // ____  \\   \  //  / ||  |   \   \  //   |]],
      [[|: \.   \\  | \/    |  /  /    ) :)\\  \/. ./  |:  |   /\\  \/.    |]],
      [[|.  \    \. | // ___)_(: (____/ //  \.    //   |.  |  |: \.        |]],
      [[|    \    \ |(:      "|\        /    \\   /    /\  |\ |.  \    /:  |]],
      [[ \___|\____\) \_______) \"_____/      \__/    (__\_|_)|___|\__/|___|]],
      [[                                                                    ]],
    },
    ['Thursday'] = {
      [[                                                                                              ]],
      [[ _____   ______        ______           _____     ____      ____  ____      ______  _______   ]],
      [[|\    \ |\     \   ___|\     \     ____|\    \   |    |    |    ||    |    |      \/       \  ]],
      [[ \\    \| \     \ |     \     \   /     /\    \  |    |    |    ||    |   /          /\     \ ]],
      [[  \|    \  \     ||     ,_____/| /     /  \    \ |    |    |    ||    |  /     /\   / /\     |]],
      [[   |     \  |    ||     \--'\_|/|     |    |    ||    |    |    ||    | /     /\ \_/ / /    /|]],
      [[   |      \ |    ||     /___/|  |     |    |    ||    |    |    ||    ||     |  \|_|/ /    / |]],
      [[   |    |\ \|    ||     \____|\ |\     \  /    /||\    \  /    /||    ||     |       |    |  |]],
      [[   |____||\_____/||____ '     /|| \_____\/____/ || \ ___\/___ / ||____||\____\       |____|  /]],
      [[   |    |/ \|   |||    /_____/ | \ |    ||    | / \ |   ||   | / |    || |    |      |    | / ]],
      [[   |____|   |___|/|____|     | /  \|____||____|/   \|___||___|/  |____| \|____|      |____|/  ]],
      [[     \(       )/    \( |_____|/      \(    )/        \(    )/      \(      \(          )/     ]],
      [[      '       '      '    )/          '    '          '    '        '       '          '      ]],
      [[                          '                                                                   ]],
      [[                                                                                              ]],
    },
    ['Friday'] = {
      [[                                                                                   ]],
      [[      ___           ___           ___           ___                       ___      ]],
      [[     /\__\         /\  \         /\  \         /\__\          ___        /\__\     ]],
      [[    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |    ]],
      [[   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |    ]],
      [[  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__  ]],
      [[ /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ]],
      [[ \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ]],
      [[     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  /  ]],
      [[     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /   ]],
      [[     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /    ]],
      [[     \/__/         \/__/         \/__/                                   \/__/     ]],
      [[                                                                                   ]],
      [[                                                                                   ]],
    },
    ['Saturday'] = {
      [[                                                                    ]],
      [[ ________   _______   ________  ___      ___ ___  _____ ______      ]],
      [[|\   ___  \|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \    ]],
      [[\ \  \\ \  \ \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \   ]],
      [[ \ \  \\ \  \ \  \_|/_\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
      [[  \ \  \\ \  \ \  \_|\ \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \ ]],
      [[   \ \__\\ \__\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\]],
      [[    \|__| \|__|\|_______|\|_______|\|__|/       \|__|\|__|     \|__|]],
      [[                                                                    ]],
    },
    ['Sunday'] = {
      [[         __            __           __     __        __        __        __  __      ]],
      [[        /\ \     _    /\ \         /\ \   /\ \    _ / /\      /\ \      /\_\/\_\ _   ]],
      [[       /  \ \   /\_\ /  \ \       /  \ \  \ \ \  /_/ / /      \ \ \    / / / / //\_\ ]],
      [[      / /\ \ \_/ / // /\ \ \     / /\ \ \  \ \ \ \___\/       /\ \_\  /\ \/ \ \/ / / ]],
      [[     / / /\ \___/ // / /\ \_\   / / /\ \ \ / / /  \ \ \      / /\/_/ /  \____\__/ /  ]],
      [[    / / /  \/____// /_/_ \/_/  / / /  \ \_\\ \ \   \_\ \    / / /   / /\/________/   ]],
      [[   / / /    / / // /____/\    / / /   / / / \ \ \  / / /   / / /   / / /\/_// / /    ]],
      [[  / / /    / / // /\____\/   / / /   / / /   \ \ \/ / /   / / /   / / /    / / /     ]],
      [[ / / /    / / // / /______  / / /___/ / /     \ \ \/ /___/ / /__ / / /    / / /      ]],
      [[/ / /    / / // / /_______\/ / /____\/ /       \ \  //\__\/_/___\\/_/    / / /       ]],
      [[\/_/     \/_/ \/__________/\/_________/         \_\/ \/_________/        \/_/        ]],
      [[                                                                                     ]],
    },
  }
end

local function default_header()
  return {
    [[                                                                    ]],
    [[ _____  ___    _______    ______  ___      ___  __     ___      ___ ]],
    [[(\"   \|"  \  /"     "|  /    " \|"  \    /"  ||" \   |"  \    /"  |]],
    [[|.\\   \    |(: ______) // ____  \\   \  //  / ||  |   \   \  //   |]],
    [[|: \.   \\  | \/    |  /  /    ) :)\\  \/. ./  |:  |   /\\  \/.    |]],
    [[|.  \    \. | // ___)_(: (____/ //  \.    //   |.  |  |: \.        |]],
    [[|    \    \ |(:      "|\        /    \\   /    /\  |\ |.  \    /:  |]],
    [[ \___|\____\) \_______) \"_____/      \__/    (__\_|_)|___|\__/|___|]],
    [[                                                                    ]],
  }
end

local function week_header(concat, append)
  local week = week_ascii_text()
  local daysoftheweek =
    { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' }
  -- local day = daysoftheweek[os.date('*t').wday]
  local randomIndex = math.random(1, #daysoftheweek)
  local day = daysoftheweek[randomIndex]
  local tbl = week[day]
  if append then
    vim.list_extend(tbl, append)
  end
  table.insert(tbl, '')
  return tbl
end

local function generate_header(config)
  if not vim.bo[config.bufnr].modifiable then
    vim.bo[config.bufnr].modifiable = true
  end
  if not config.command then
    local header = config.week_header
        and config.week_header.enable
        and week_header(config.week_header.concat, config.week_header.append)
      or (config.header or default_header())
    api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(header))

    for i, _ in ipairs(header) do
      vim.api.nvim_buf_add_highlight(config.bufnr, 0, 'DashboardHeader', i - 1, 0, -1)
    end
    return
  end

  local empty_table = utils.generate_empty_table(config.file_height + 4)
  api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(empty_table))
  local preview = require('dashboard.preview')
  preview:open_preview({
    width = config.file_width,
    height = config.file_height,
    cmd = config.command .. ' ' .. config.file_path,
  })
end

return {
  generate_header = generate_header,
}
