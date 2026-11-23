# Dotfiles

_[rcm](https://github.com/thoughtbot/rcm) powered dotfiles for macOS (Apple silicon)._

## Install

```sh
git clone https://github.com/imranolas/dotfiles ~/.dotfiles
~/.dotfiles/install.sh          # add --macos to also apply macOS defaults
```

`install.sh` is safe to re-run. It installs Homebrew and everything in the `Brewfile`,
links the dotfiles with `rcup`, installs runtimes with mise, and makes fish the default shell.

## What's here

| Path | What |
| --- | --- |
| `Brewfile` | CLI tools, apps and fonts |
| `config/fish` | Shell config, git abbreviations (`conf.d/abbr.fish`), fisher plugins |
| `config/ghostty` | Terminal |
| `config/mise` | Global node / python / bun / pnpm versions |
| `config/starship.toml` | Prompt |
| `gitconfig`, `gitignore` | Git (delta pager, Zed editor, SSH signing via 1Password) |
| `ssh/config` | Uses the 1Password SSH agent |
| `macos.sh` | macOS defaults |

## Per-machine config (not tracked)

- `~/.gitconfig.local`: work email, `user.signingkey`, `commit.gpgsign = true`
- `~/.ssh/config.local`: extra SSH hosts
