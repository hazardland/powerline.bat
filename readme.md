# Intro

Ever wondered why you dont have something like this in Windows cmd.exe command prompt?

![alt text](./images/power_line.png)

Me sometimes until I pushed on a wrong branch then after researching in the toilet it become obvious that it is totally doable using magic command of cmd.exe ```prompt```:

Here is powerline in Windows Terminal Preview running cmd.exe
![alt text](./images/windows_terminal_preview_powerline.png)

And this is Sublime Text running Terminus terminal running cmd.exe
![alt text](./images/sublime_text_terminus_powerline.png)

# Prerequesites

To have it you will need:

1. Windows Terminal Preview from Microsoft Store https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701
2. A font containing powerline symbols in my case 'Cascadia Code PL' from Microsoft github repo https://github.com/microsoft/cascadia-code/releases


In case of Sublime Text:
1. Terminal module Terminus for Sublime Text https://packagecontrol.io/packages/Terminus
2. And I do not remember for sure if this package also helped for displaying colors https://packagecontrol.io/packages/ANSIescape in Terminus


# Setup


Clone repo in some local folder. Let us assume path is ```d:\path\to\powerline```

## Windows Terminal Preview Setup
Basically our goal is to start init.bat after cmd.exe is lounched. i.e. to run ```cmd.exe /k d:\\path\\to\\powerline\\init.bat``` In case of windows terminal we can configure profile like this:
```json
{
    ...
    "commandline" : "cmd.exe /k d:\\path\\to\\powerline\\init.bat",
    "fontFace" : "Cascadia Code PL",
    ....
},
```

# Sublime Text Setup

This is ```Terminus.sublime-settings``` file

```json
{
    "256color": true,
    "theme": "campbell",
    "user_theme_colors":
    {
        "background": "#0c0c0c",
        "block_caret": "white",
        "caret": "white",
        "foreground": "#cccccc",
        "selection": "#444444",
        "selection_foreground": "#ffffff"
    },
    "view_settings":
    {
        "font_face": "Cascadia Code PL",
        "font_options":
        [
            "gray_antialias",
            "subpixel_antialias",
            "gdi"
        ],
    },
    "shell_configs": [
        {
            "name": "Command Prompt",
            "cmd": ["cmd.exe", "/k", "d:\\path\\to\\powerline\\init.bat"],
            "env": {},
            "enable": true,
            "platforms": ["windows"]
        },
    ]
}
```

And this is Sublime keymaps file configured for terminus:

```json
[
    {"keys": ["ctrl+`"], "command": "toggle_terminus_panel", "args": {
             "cwd": "${file_path:${folder}}"
         }
    }
]
```
