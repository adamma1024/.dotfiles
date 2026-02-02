# .dotfiles

All dot files in one repo, base on 👉[dotbot](https://github.com/anishathalye/dotbot)

## Usage

### MacOS
>
> 🎉 Only one line command, solve all dot files!

#### install
```bash
  /bin/bash -c "$(curl -fsSL /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### backup

```sh 
sh ./mac/backup-mac.sh
```


```

### Windows

⚠️P Please install the pwsh v7+ first.

```
pwsh ./install-win.ps1
```

### Claude Code

Configuration files for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) are stored in `.claude/` and symlinked to `~/.claude/`:

- `commands/` - Custom slash commands
- `hooks/` - Event hooks for tool calls
- `skills/` - Skill definitions for specialized tasks
- `settings.json` - Claude Code settings
- `settings.md` - Settings documentation
- `CLAUDE.md` - Global instructions for Claude

### iTerm profile

Import the iTerm's profile from the `./iterm/ML Theme.json`
Also, I am using the [Dracula](https://draculatheme.com/) theme, since I love the awesome concept of Dracula.
> Dracula can't live in the sunlight.
But, it seems that they'll provide the light theme soon, Lmao 😂

# TODOs

## Windows

1. Map gitconfig
2. Drill down why did the symbolic link not work

## MacOS

1. Add installing steps for Homebrow, iterms, zsh, neovim, nerd font, starship
2. ln more configurations

# Friend Links

Inspired by [Teacher Tang](https://github.com/logTXT) 😘
