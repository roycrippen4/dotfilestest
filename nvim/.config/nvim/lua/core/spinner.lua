local M = {}

---@param name? Spinner
function M.spin(name)
  name = name or 'dots'
  local spinner = M.spinners[name] or M.spinners['dots']
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / spinner.interval) % #spinner.frames
  return spinner.frames[frame + 1]
end

M.spinner_colors = {
  SpinnerRed = '%#SpinnerRed#',
  SpinnerNeonCarrot = '%#SpinnerNeonCarrot#',
  SpinnerOrange = '%#SpinnerOrange#',
  SpinnerGold = '%#SpinnerGold#',
  SpinnerYellow = '%#SpinnerYellow#',
  SpinnerLimeGreen = '%#SpinnerLimeGreen#',
  SpinnerBrightGreen = '%#SpinnerBrightGreen#',
  SpinnerSpringGreen = '%#SpinnerSpringGreen#',
  SpinnerCyan = '%#SpinnerCyan#',
  SpinnerAzure = '%#SpinnerAzure#',
  SpinnerBlue = '%#SpinnerBlue#',
  SpinnerViolet = '%#SpinnerViolet#',
  SpinnerVioleter = '%#SpinnerVioleter#',
  SpinnerHotPink = '%#SpinnerHotPink#',
}

---@alias Spinner
---| "aesthetic"
---| "arc"
---| "arrow"
---| "arrow2"
---| "arrow3"
---| "balloon"
---| "balloon2"
---| "betaWave"
---| "bluePulse"
---| "bounce"
---| "bouncingBall"
---| "bouncingBar"
---| "boxBounce"
---| "boxBounce2"
---| "christmas"
---| "circle"
---| "circleHalves"
---| "circleQuarters"
---| "circleFull"
---| "clock"
---| "dots"
---| "dots10"
---| "dots11"
---| "dots12"
---| "dots13"
---| "dots2"
---| "dots3"
---| "dots4"
---| "dots5"
---| "dots6"
---| "dots7"
---| "dots8"
---| "dots8Bit"
---| "dots9"
---| "dqpb"
---| "earth"
---| "fingerDance"
---| "fistBump"
---| "flip"
---| "grenade"
---| "growHorizontal"
---| "growVertical"
---| "hamburger"
---| "hearts"
---| "layer"
---| "line"
---| "line2"
---| "material"
---| "mindblown"
---| "monkey"
---| "moon"
---| "noise"
---| "orangeBluePulse"
---| "orangePulse"
---| "pipe"
---| "point"
---| "pong"
---| "runner"
---| "sand"
---| "shark"
---| "simpleDots"
---| "simpleDotsScrolling"
---| "smiley"
---| "soccerHeader"
---| "speaker"
---| "squareCorners"
---| "squish"
---| "star"
---| "star2"
---| "timeTravel"
---| "toggle"
---| "toggle10"
---| "toggle11"
---| "toggle12"
---| "toggle13"
---| "toggle2"
---| "toggle3"
---| "toggle4"
---| "toggle5"
---| "toggle6"
---| "toggle7"
---| "toggle8"
---| "toggle9"
---| "triangle"
---| "weather"

--- Spinners from https://github.com/sindresorhus/cli-spinners
---@enum
M.spinners = {
  aesthetic = {
    frames = {
      '▰▱▱▱▱▱▱',
      '▰▰▱▱▱▱▱',
      '▰▰▰▱▱▱▱',
      '▰▰▰▰▱▱▱',
      '▰▰▰▰▰▱▱',
      '▰▰▰▰▰▰▱',
      '▰▰▰▰▰▰▰',
      '▰▱▱▱▱▱▱',
    },
    interval = 80,
  },
  arc = { frames = { '◜', '◠', '◝', '◞', '◡', '◟' }, interval = 100 },
  arrow = { frames = { '←', '↖', '↑', '↗', '→', '↘', '↓', '↙' }, interval = 100 },
  arrow2 = {
    frames = { '⬆️ ', '↗️ ', '➡️ ', '↘️ ', '⬇️ ', '↙️ ', '⬅️ ', '↖️ ' },
    interval = 80,
  },
  arrow3 = {
    frames = {
      '▹▹▹▹▹',
      '▸▹▹▹▹',
      '▹▸▹▹▹',
      '▹▹▸▹▹',
      '▹▹▹▸▹',
      '▹▹▹▹▸',
    },
    interval = 120,
  },
  balloon = { frames = { ' ', '.', 'o', 'O', '@', '*', ' ' }, interval = 140 },
  balloon2 = { frames = { '.', 'o', 'O', '°', 'O', 'o', '.' }, interval = 120 },
  betaWave = {
    frames = {
      'ρββββββ',
      'βρβββββ',
      'ββρββββ',
      'βββρβββ',
      'ββββρββ',
      'βββββρβ',
      'ββββββρ',
    },
    interval = 80,
  },
  bluePulse = { frames = { '🔹 ', '🔷 ', '🔵 ', '🔵 ', '🔷 ' }, interval = 100 },
  bounce = { frames = { '⠁', '⠂', '⠄', '⠂' }, interval = 120 },
  bouncingBall = {
    frames = {
      '( ●    )',
      '(  ●   )',
      '(   ●  )',
      '(    ● )',
      '(     ●)',
      '(    ● )',
      '(   ●  )',
      '(  ●   )',
      '( ●    )',
      '(●     )',
    },
    interval = 80,
  },
  bouncingBar = {
    frames = {
      '[    ]',
      '[=   ]',
      '[==  ]',
      '[=== ]',
      '[ ===]',
      '[  ==]',
      '[   =]',
      '[    ]',
      '[   =]',
      '[  ==]',
      '[ ===]',
      '[====]',
      '[=== ]',
      '[==  ]',
      '[=   ]',
    },
    interval = 80,
  },
  boxBounce = { frames = { '▖', '▘', '▝', '▗' }, interval = 120 },
  boxBounce2 = { frames = { '▌', '▀', '▐', '▄' }, interval = 100 },
  christmas = { frames = { '🌲', '🎄' }, interval = 400 },
  circle = { frames = { '◡', '⊙', '◠' }, interval = 120 },
  circleHalves = { frames = { '◐', '◓', '◑', '◒' }, interval = 50 },
  circleQuarters = { frames = { '◴', '◷', '◶', '◵' }, interval = 120 },
  circleFull = {
    frames = { '', '󰪞', '󰪟', '󰪠', '󰪢', '󰪣', '󰪤', '󰪥' },
    interval = 120,
  },
  clock = {
    frames = {
      '🕛 ',
      '🕐 ',
      '🕑 ',
      '🕒 ',
      '🕓 ',
      '🕔 ',
      '🕕 ',
      '🕖 ',
      '🕗 ',
      '🕘 ',
      '🕙 ',
      '🕚 ',
    },
    interval = 100,
  },
  dots = { frames = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }, interval = 80 },
  dots10 = { frames = { '⢄', '⢂', '⢁', '⡁', '⡈', '⡐', '⡠' }, interval = 80 },
  dots11 = { frames = { '⠁', '⠂', '⠄', '⡀', '⢀', '⠠', '⠐', '⠈' }, interval = 100 },
  dots12 = {
    frames = {
      '⢀⠀',
      '⡀⠀',
      '⠄⠀',
      '⢂⠀',
      '⡂⠀',
      '⠅⠀',
      '⢃⠀',
      '⡃⠀',
      '⠍⠀',
      '⢋⠀',
      '⡋⠀',
      '⠍⠁',
      '⢋⠁',
      '⡋⠁',
      '⠍⠉',
      '⠋⠉',
      '⠋⠉',
      '⠉⠙',
      '⠉⠙',
      '⠉⠩',
      '⠈⢙',
      '⠈⡙',
      '⢈⠩',
      '⡀⢙',
      '⠄⡙',
      '⢂⠩',
      '⡂⢘',
      '⠅⡘',
      '⢃⠨',
      '⡃⢐',
      '⠍⡐',
      '⢋⠠',
      '⡋⢀',
      '⠍⡁',
      '⢋⠁',
      '⡋⠁',
      '⠍⠉',
      '⠋⠉',
      '⠋⠉',
      '⠉⠙',
      '⠉⠙',
      '⠉⠩',
      '⠈⢙',
      '⠈⡙',
      '⠈⠩',
      '⠀⢙',
      '⠀⡙',
      '⠀⠩',
      '⠀⢘',
      '⠀⡘',
      '⠀⠨',
      '⠀⢐',
      '⠀⡐',
      '⠀⠠',
      '⠀⢀',
      '⠀⡀',
    },
    interval = 80,
  },
  dots13 = { frames = { '⣼', '⣹', '⢻', '⠿', '⡟', '⣏', '⣧', '⣶' }, interval = 80 },
  dots2 = { frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' }, interval = 80 },
  dots3 = { frames = { '⠋', '⠙', '⠚', '⠞', '⠖', '⠦', '⠴', '⠲', '⠳', '⠓' }, interval = 80 },
  dots4 = {
    frames = { '⠄', '⠆', '⠇', '⠋', '⠙', '⠸', '⠰', '⠠', '⠰', '⠸', '⠙', '⠋', '⠇', '⠆' },
    interval = 80,
  },
  dots5 = {
    frames = {
      '⠋',
      '⠙',
      '⠚',
      '⠒',
      '⠂',
      '⠂',
      '⠒',
      '⠲',
      '⠴',
      '⠦',
      '⠖',
      '⠒',
      '⠐',
      '⠐',
      '⠒',
      '⠓',
      '⠋',
    },
    interval = 80,
  },
  dots6 = {
    frames = {
      '⠁',
      '⠉',
      '⠙',
      '⠚',
      '⠒',
      '⠂',
      '⠂',
      '⠒',
      '⠲',
      '⠴',
      '⠤',
      '⠄',
      '⠄',
      '⠤',
      '⠴',
      '⠲',
      '⠒',
      '⠂',
      '⠂',
      '⠒',
      '⠚',
      '⠙',
      '⠉',
      '⠁',
    },
    interval = 80,
  },
  dots7 = {
    frames = {
      '⠈',
      '⠉',
      '⠋',
      '⠓',
      '⠒',
      '⠐',
      '⠐',
      '⠒',
      '⠖',
      '⠦',
      '⠤',
      '⠠',
      '⠠',
      '⠤',
      '⠦',
      '⠖',
      '⠒',
      '⠐',
      '⠐',
      '⠒',
      '⠓',
      '⠋',
      '⠉',
      '⠈',
    },
    interval = 80,
  },
  dots8 = {
    frames = {
      '⠁',
      '⠁',
      '⠉',
      '⠙',
      '⠚',
      '⠒',
      '⠂',
      '⠂',
      '⠒',
      '⠲',
      '⠴',
      '⠤',
      '⠄',
      '⠄',
      '⠤',
      '⠠',
      '⠠',
      '⠤',
      '⠦',
      '⠖',
      '⠒',
      '⠐',
      '⠐',
      '⠒',
      '⠓',
      '⠋',
      '⠉',
      '⠈',
      '⠈',
    },
    interval = 80,
  },
  dots8Bit = {
    frames = {
      '⠀',
      '⠁',
      '⠂',
      '⠃',
      '⠄',
      '⠅',
      '⠆',
      '⠇',
      '⡀',
      '⡁',
      '⡂',
      '⡃',
      '⡄',
      '⡅',
      '⡆',
      '⡇',
      '⠈',
      '⠉',
      '⠊',
      '⠋',
      '⠌',
      '⠍',
      '⠎',
      '⠏',
      '⡈',
      '⡉',
      '⡊',
      '⡋',
      '⡌',
      '⡍',
      '⡎',
      '⡏',
      '⠐',
      '⠑',
      '⠒',
      '⠓',
      '⠔',
      '⠕',
      '⠖',
      '⠗',
      '⡐',
      '⡑',
      '⡒',
      '⡓',
      '⡔',
      '⡕',
      '⡖',
      '⡗',
      '⠘',
      '⠙',
      '⠚',
      '⠛',
      '⠜',
      '⠝',
      '⠞',
      '⠟',
      '⡘',
      '⡙',
      '⡚',
      '⡛',
      '⡜',
      '⡝',
      '⡞',
      '⡟',
      '⠠',
      '⠡',
      '⠢',
      '⠣',
      '⠤',
      '⠥',
      '⠦',
      '⠧',
      '⡠',
      '⡡',
      '⡢',
      '⡣',
      '⡤',
      '⡥',
      '⡦',
      '⡧',
      '⠨',
      '⠩',
      '⠪',
      '⠫',
      '⠬',
      '⠭',
      '⠮',
      '⠯',
      '⡨',
      '⡩',
      '⡪',
      '⡫',
      '⡬',
      '⡭',
      '⡮',
      '⡯',
      '⠰',
      '⠱',
      '⠲',
      '⠳',
      '⠴',
      '⠵',
      '⠶',
      '⠷',
      '⡰',
      '⡱',
      '⡲',
      '⡳',
      '⡴',
      '⡵',
      '⡶',
      '⡷',
      '⠸',
      '⠹',
      '⠺',
      '⠻',
      '⠼',
      '⠽',
      '⠾',
      '⠿',
      '⡸',
      '⡹',
      '⡺',
      '⡻',
      '⡼',
      '⡽',
      '⡾',
      '⡿',
      '⢀',
      '⢁',
      '⢂',
      '⢃',
      '⢄',
      '⢅',
      '⢆',
      '⢇',
      '⣀',
      '⣁',
      '⣂',
      '⣃',
      '⣄',
      '⣅',
      '⣆',
      '⣇',
      '⢈',
      '⢉',
      '⢊',
      '⢋',
      '⢌',
      '⢍',
      '⢎',
      '⢏',
      '⣈',
      '⣉',
      '⣊',
      '⣋',
      '⣌',
      '⣍',
      '⣎',
      '⣏',
      '⢐',
      '⢑',
      '⢒',
      '⢓',
      '⢔',
      '⢕',
      '⢖',
      '⢗',
      '⣐',
      '⣑',
      '⣒',
      '⣓',
      '⣔',
      '⣕',
      '⣖',
      '⣗',
      '⢘',
      '⢙',
      '⢚',
      '⢛',
      '⢜',
      '⢝',
      '⢞',
      '⢟',
      '⣘',
      '⣙',
      '⣚',
      '⣛',
      '⣜',
      '⣝',
      '⣞',
      '⣟',
      '⢠',
      '⢡',
      '⢢',
      '⢣',
      '⢤',
      '⢥',
      '⢦',
      '⢧',
      '⣠',
      '⣡',
      '⣢',
      '⣣',
      '⣤',
      '⣥',
      '⣦',
      '⣧',
      '⢨',
      '⢩',
      '⢪',
      '⢫',
      '⢬',
      '⢭',
      '⢮',
      '⢯',
      '⣨',
      '⣩',
      '⣪',
      '⣫',
      '⣬',
      '⣭',
      '⣮',
      '⣯',
      '⢰',
      '⢱',
      '⢲',
      '⢳',
      '⢴',
      '⢵',
      '⢶',
      '⢷',
      '⣰',
      '⣱',
      '⣲',
      '⣳',
      '⣴',
      '⣵',
      '⣶',
      '⣷',
      '⢸',
      '⢹',
      '⢺',
      '⢻',
      '⢼',
      '⢽',
      '⢾',
      '⢿',
      '⣸',
      '⣹',
      '⣺',
      '⣻',
      '⣼',
      '⣽',
      '⣾',
      '⣿',
    },
    interval = 80,
  },
  dots9 = { frames = { '⢹', '⢺', '⢼', '⣸', '⣇', '⡧', '⡗', '⡏' }, interval = 80 },
  dqpb = { frames = { 'd', 'q', 'p', 'b' }, interval = 100 },
  earth = { frames = { '🌍 ', '🌎 ', '🌏 ' }, interval = 180 },
  fingerDance = { frames = { '🤘 ', '🤟 ', '🖖 ', '✋ ', '🤚 ', '👆 ' }, interval = 160 },
  fistBump = {
    frames = {
      '🤜　　　　🤛 ',
      '🤜　　　　🤛 ',
      '🤜　　　　🤛 ',
      '　🤜　　🤛　 ',
      '　　🤜🤛　　 ',
      '　🤜✨🤛　　 ',
      '🤜　✨　🤛　 ',
    },
    interval = 80,
  },
  flip = { frames = { '_', '_', '_', '-', '`', '`', "'", '´', '-', '_', '_', '_' }, interval = 70 },
  grenade = {
    frames = {
      '،  ',
      '′  ',
      ' ´ ',
      ' ‾ ',
      '  ⸌',
      '  ⸊',
      '  |',
      '  ⁎',
      '  ⁕',
      ' ෴ ',
      '  ⁓',
      '   ',
      '   ',
      '   ',
    },
    interval = 80,
  },
  growHorizontal = {
    frames = { '▏', '▎', '▍', '▌', '▋', '▊', '▉', '▊', '▋', '▌', '▍', '▎' },
    interval = 120,
  },
  growVertical = { frames = { '▁', '▃', '▄', '▅', '▆', '▇', '▆', '▅', '▄', '▃' }, interval = 120 },
  hamburger = { frames = { '☱', '☲', '☴' }, interval = 100 },
  hearts = { frames = { '💛 ', '💙 ', '💜 ', '💚 ', '❤️ ' }, interval = 100 },
  layer = { frames = { '-', '=', '≡' }, interval = 150 },
  line = { frames = { '-', '\\', '|', '/' }, interval = 130 },
  line2 = { frames = { '⠂', '-', '–', '—', '–', '-' }, interval = 100 },
  material = {
    frames = {
      '█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '███▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '████▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '██████▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '██████▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '███████▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '████████▁▁▁▁▁▁▁▁▁▁▁▁',
      '█████████▁▁▁▁▁▁▁▁▁▁▁',
      '█████████▁▁▁▁▁▁▁▁▁▁▁',
      '██████████▁▁▁▁▁▁▁▁▁▁',
      '███████████▁▁▁▁▁▁▁▁▁',
      '█████████████▁▁▁▁▁▁▁',
      '██████████████▁▁▁▁▁▁',
      '██████████████▁▁▁▁▁▁',
      '▁██████████████▁▁▁▁▁',
      '▁██████████████▁▁▁▁▁',
      '▁██████████████▁▁▁▁▁',
      '▁▁██████████████▁▁▁▁',
      '▁▁▁██████████████▁▁▁',
      '▁▁▁▁█████████████▁▁▁',
      '▁▁▁▁██████████████▁▁',
      '▁▁▁▁██████████████▁▁',
      '▁▁▁▁▁██████████████▁',
      '▁▁▁▁▁██████████████▁',
      '▁▁▁▁▁██████████████▁',
      '▁▁▁▁▁▁██████████████',
      '▁▁▁▁▁▁██████████████',
      '▁▁▁▁▁▁▁█████████████',
      '▁▁▁▁▁▁▁█████████████',
      '▁▁▁▁▁▁▁▁████████████',
      '▁▁▁▁▁▁▁▁████████████',
      '▁▁▁▁▁▁▁▁▁███████████',
      '▁▁▁▁▁▁▁▁▁███████████',
      '▁▁▁▁▁▁▁▁▁▁██████████',
      '▁▁▁▁▁▁▁▁▁▁██████████',
      '▁▁▁▁▁▁▁▁▁▁▁▁████████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁███████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁██████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████',
      '█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████',
      '██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███',
      '██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███',
      '███▁▁▁▁▁▁▁▁▁▁▁▁▁▁███',
      '████▁▁▁▁▁▁▁▁▁▁▁▁▁▁██',
      '█████▁▁▁▁▁▁▁▁▁▁▁▁▁▁█',
      '█████▁▁▁▁▁▁▁▁▁▁▁▁▁▁█',
      '██████▁▁▁▁▁▁▁▁▁▁▁▁▁█',
      '████████▁▁▁▁▁▁▁▁▁▁▁▁',
      '█████████▁▁▁▁▁▁▁▁▁▁▁',
      '█████████▁▁▁▁▁▁▁▁▁▁▁',
      '█████████▁▁▁▁▁▁▁▁▁▁▁',
      '█████████▁▁▁▁▁▁▁▁▁▁▁',
      '███████████▁▁▁▁▁▁▁▁▁',
      '████████████▁▁▁▁▁▁▁▁',
      '████████████▁▁▁▁▁▁▁▁',
      '██████████████▁▁▁▁▁▁',
      '██████████████▁▁▁▁▁▁',
      '▁██████████████▁▁▁▁▁',
      '▁██████████████▁▁▁▁▁',
      '▁▁▁█████████████▁▁▁▁',
      '▁▁▁▁▁████████████▁▁▁',
      '▁▁▁▁▁████████████▁▁▁',
      '▁▁▁▁▁▁███████████▁▁▁',
      '▁▁▁▁▁▁▁▁█████████▁▁▁',
      '▁▁▁▁▁▁▁▁█████████▁▁▁',
      '▁▁▁▁▁▁▁▁▁█████████▁▁',
      '▁▁▁▁▁▁▁▁▁█████████▁▁',
      '▁▁▁▁▁▁▁▁▁▁█████████▁',
      '▁▁▁▁▁▁▁▁▁▁▁████████▁',
      '▁▁▁▁▁▁▁▁▁▁▁████████▁',
      '▁▁▁▁▁▁▁▁▁▁▁▁███████▁',
      '▁▁▁▁▁▁▁▁▁▁▁▁███████▁',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁███████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁███████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
      '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
    },
    interval = 17,
  },
  mindblown = {
    frames = {
      '😐 ',
      '😐 ',
      '😮 ',
      '😮 ',
      '😦 ',
      '😦 ',
      '😧 ',
      '😧 ',
      '🤯 ',
      '💥 ',
      '✨ ',
      '　 ',
      '　 ',
      '　 ',
    },
    interval = 160,
  },
  monkey = { frames = { '🙈 ', '🙈 ', '🙉 ', '🙊 ' }, interval = 300 },
  moon = { frames = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' }, interval = 80 },
  noise = { frames = { '▓', '▒', '░' }, interval = 100 },
  orangeBluePulse = {
    frames = { '🔸 ', '🔶 ', '🟠 ', '🟠 ', '🔶 ', '🔹 ', '🔷 ', '🔵 ', '🔵 ', '🔷 ' },
    interval = 100,
  },
  orangePulse = { frames = { '🔸 ', '🔶 ', '🟠 ', '🟠 ', '🔶 ' }, interval = 100 },
  pipe = { frames = { '┤', '┘', '┴', '└', '├', '┌', '┬', '┐' }, interval = 100 },
  point = { frames = { '∙∙∙', '●∙∙', '∙●∙', '∙∙●', '∙∙∙' }, interval = 125 },
  pong = {
    frames = {
      '▐⠂       ▌',
      '▐⠈       ▌',
      '▐ ⠂      ▌',
      '▐ ⠠      ▌',
      '▐  ⡀     ▌',
      '▐  ⠠     ▌',
      '▐   ⠂    ▌',
      '▐   ⠈    ▌',
      '▐    ⠂   ▌',
      '▐    ⠠   ▌',
      '▐     ⡀  ▌',
      '▐     ⠠  ▌',
      '▐      ⠂ ▌',
      '▐      ⠈ ▌',
      '▐       ⠂▌',
      '▐       ⠠▌',
      '▐       ⡀▌',
      '▐      ⠠ ▌',
      '▐      ⠂ ▌',
      '▐     ⠈  ▌',
      '▐     ⠂  ▌',
      '▐    ⠠   ▌',
      '▐    ⡀   ▌',
      '▐   ⠠    ▌',
      '▐   ⠂    ▌',
      '▐  ⠈     ▌',
      '▐  ⠂     ▌',
      '▐ ⠠      ▌',
      '▐ ⡀      ▌',
      '▐⠠       ▌',
    },
    interval = 80,
  },
  runner = { frames = { '🚶 ', '🏃 ' }, interval = 140 },
  sand = {
    frames = {
      '⠁',
      '⠂',
      '⠄',
      '⡀',
      '⡈',
      '⡐',
      '⡠',
      '⣀',
      '⣁',
      '⣂',
      '⣄',
      '⣌',
      '⣔',
      '⣤',
      '⣥',
      '⣦',
      '⣮',
      '⣶',
      '⣷',
      '⣿',
      '⡿',
      '⠿',
      '⢟',
      '⠟',
      '⡛',
      '⠛',
      '⠫',
      '⢋',
      '⠋',
      '⠍',
      '⡉',
      '⠉',
      '⠑',
      '⠡',
      '⢁',
    },
    interval = 80,
  },
  shark = {
    frames = {
      '▐|\\____________▌',
      '▐_|\\___________▌',
      '▐__|\\__________▌',
      '▐___|\\_________▌',
      '▐____|\\________▌',
      '▐_____|\\_______▌',
      '▐______|\\______▌',
      '▐_______|\\_____▌',
      '▐________|\\____▌',
      '▐_________|\\___▌',
      '▐__________|\\__▌',
      '▐___________|\\_▌',
      '▐____________|\\▌',
      '▐____________/|▌',
      '▐___________/|_▌',
      '▐__________/|__▌',
      '▐_________/|___▌',
      '▐________/|____▌',
      '▐_______/|_____▌',
      '▐______/|______▌',
      '▐_____/|_______▌',
      '▐____/|________▌',
      '▐___/|_________▌',
      '▐__/|__________▌',
      '▐_/|___________▌',
      '▐/|____________▌',
    },
    interval = 120,
  },
  simpleDots = { frames = { '.  ', '.. ', '...', '   ' }, interval = 400 },
  simpleDotsScrolling = { frames = { '.  ', '.. ', '...', ' ..', '  .', '   ' }, interval = 200 },
  smiley = { frames = { '😄 ', '😝 ' }, interval = 200 },
  soccerHeader = {
    frames = {
      ' 🧑⚽️       🧑 ',
      '🧑  ⚽️      🧑 ',
      '🧑   ⚽️     🧑 ',
      '🧑    ⚽️    🧑 ',
      '🧑     ⚽️   🧑 ',
      '🧑      ⚽️  🧑 ',
      '🧑       ⚽️🧑  ',
      '🧑      ⚽️  🧑 ',
      '🧑     ⚽️   🧑 ',
      '🧑    ⚽️    🧑 ',
      '🧑   ⚽️     🧑 ',
      '🧑  ⚽️      🧑 ',
    },
    interval = 80,
  },
  speaker = { frames = { '🔈 ', '🔉 ', '🔊 ', '🔉 ' }, interval = 160 },
  squareCorners = { frames = { '◰', '◳', '◲', '◱' }, interval = 180 },
  squish = { frames = { '╫', '╪' }, interval = 100 },
  star = { frames = { '✶', '✸', '✹', '✺', '✹', '✷' }, interval = 70 },
  star2 = { frames = { '+', 'x', '*' }, interval = 80 },
  timeTravel = {
    frames = {
      '🕛 ',
      '🕚 ',
      '🕙 ',
      '🕘 ',
      '🕗 ',
      '🕖 ',
      '🕕 ',
      '🕔 ',
      '🕓 ',
      '🕒 ',
      '🕑 ',
      '🕐 ',
    },
    interval = 100,
  },
  toggle = { frames = { '⊶', '⊷' }, interval = 250 },
  toggle10 = { frames = { '㊂', '㊀', '㊁' }, interval = 100 },
  toggle11 = { frames = { '⧇', '⧆' }, interval = 50 },
  toggle12 = { frames = { '☗', '☖' }, interval = 120 },
  toggle13 = { frames = { '=', '*', '-' }, interval = 80 },
  toggle2 = { frames = { '▫', '▪' }, interval = 80 },
  toggle3 = { frames = { '□', '■' }, interval = 120 },
  toggle4 = { frames = { '■', '□', '▪', '▫' }, interval = 100 },
  toggle5 = { frames = { '▮', '▯' }, interval = 100 },
  toggle6 = { frames = { 'ဝ', '၀' }, interval = 300 },
  toggle7 = { frames = { '⦾', '⦿' }, interval = 80 },
  toggle8 = { frames = { '◍', '◌' }, interval = 100 },
  toggle9 = { frames = { '◉', '◎' }, interval = 100 },
  triangle = { frames = { '◢', '◣', '◤', '◥' }, interval = 50 },
  weather = {
    frames = {
      '☀️ ',
      '☀️ ',
      '☀️ ',
      '🌤 ',
      '⛅️ ',
      '🌥 ',
      '☁️ ',
      '🌧 ',
      '🌨 ',
      '🌧 ',
      '🌨 ',
      '🌧 ',
      '🌨 ',
      '⛈ ',
      '🌨 ',
      '🌧 ',
      '🌨 ',
      '☁️ ',
      '🌥 ',
      '⛅️ ',
      '🌤 ',
      '☀️ ',
      '☀️ ',
    },
    interval = 100,
  },
  rainbow_wave = function()
    local zero = M.spinner_colors.SpinnerRed .. '▁'
    local one = M.spinner_colors.SpinnerNeonCarrot .. '▂'
    local two = M.spinner_colors.SpinnerOrange .. '▃'
    local three = M.spinner_colors.SpinnerGold .. '▄'
    local four = M.spinner_colors.SpinnerYellow .. '▅'
    local five = M.spinner_colors.SpinnerLimeGreen .. '▆'
    local six = M.spinner_colors.SpinnerBrightGreen .. '▇'
    local seven = M.spinner_colors.SpinnerSpringGreen .. '█'
    local eight = M.spinner_colors.SpinnerCyan .. '▇'
    local nine = M.spinner_colors.SpinnerAzure .. '▆'
    local ten = M.spinner_colors.SpinnerBlue .. '▅'
    local eleven = M.spinner_colors.SpinnerViolet .. '▄'
    local twelve = M.spinner_colors.SpinnerVioleter .. '▃'
    local thirteen = M.spinner_colors.SpinnerHotPink .. '▂'

    local chars = {
      zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen,
      one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero,
      two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one,
      three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two,
      four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three,
      five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four,
      six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five,
      seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six,
      eight
        .. nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven,
      nine
        .. ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight,
      ten
        .. eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine,
      eleven
        .. twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten,
      twelve
        .. thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven,
      thirteen
        .. zero
        .. one
        .. two
        .. three
        .. four
        .. five
        .. six
        .. seven
        .. eight
        .. nine
        .. ten
        .. eleven
        .. twelve,
    }
    return chars, 100
  end,

  mutating_lines = function()
    local chars = {
      M.spinner_colors.SpinnerRed .. '︷',
      M.spinner_colors.SpinnerRed .. '︵',
      M.spinner_colors.SpinnerRed .. '︹',
      M.spinner_colors.SpinnerRed .. '︺',
      M.spinner_colors.SpinnerRed .. '︶',
      M.spinner_colors.SpinnerRed .. '︸',
      M.spinner_colors.SpinnerRed .. '︶',
      M.spinner_colors.SpinnerRed .. '︺',
      M.spinner_colors.SpinnerRed .. '︹',
      M.spinner_colors.SpinnerRed .. '︵',
    }
    return chars, 200
  end,

  braille_6_circle_worm = function()
    local chars = {
      M.spinner_colors.SpinnerRed .. '⠋',
      M.spinner_colors.SpinnerRed .. '⠙',
      M.spinner_colors.SpinnerRed .. '⠹',
      M.spinner_colors.SpinnerRed .. '⠸',
      M.spinner_colors.SpinnerRed .. '⠼',
      M.spinner_colors.SpinnerRed .. '⠴',
      M.spinner_colors.SpinnerRed .. '⠦',
      M.spinner_colors.SpinnerRed .. '⠧',
      M.spinner_colors.SpinnerRed .. '⠇',
      M.spinner_colors.SpinnerRed .. '⠏',
    }
    return chars, 200
  end,

  braille_8_circle_worm = function(color)
    local chars = {
      color .. '⠋',
      color .. '⠙',
      color .. '⠹',
      color .. '⠸',
      color .. '⢰',
      color .. '⣰',
      color .. '⣠',
      color .. '⣄',
      color .. '⣆',
      color .. '⡆',
      color .. '⠇',
      color .. '⠏',
    }
    return chars, 60
  end,
}

return M
