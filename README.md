# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each top-level directory is a stow package. Stow creates symlinks that mirror the package's internal directory structure relative to the target (usually `$HOME`).

| Package | Target | Contents | Install |
|---------|--------|----------|---------|
| `agents` | `~/.agents/` | Shared `AGENTS.md` for LLM coding agents | `make agents` |
| `config` | `~/.config/` | i3, kitty, fish | `make config` |
| `emacs` | `~/` | `.emacs.d/` | `make emacs` |
| `gemini` | `~/.gemini/` | Gemini CLI config, commands, `GEMINI.md` (symlinked to `~/.agents/AGENTS.md`) | `make gemini` |
| `gitconfig` | `~/` | `.gitconfig` | `make gitconfig` |
| `opencode` | `~/.config/opencode/` | OpenCode config, commands | `stow -t $HOME opencode` |
| `scripts` | `~/work_space/scripts/` | Utility scripts (special target path) | `make scripts` |
| `tmux` | `~/` | `.tmux.conf` | `make tmux` |
| `vim` | `~/` | `.vimrc` | `make vim` |
| `xbindkeys` | `~/` | `.xbindkeysrc` | `make xbindkeys` |
| `Xwin` | `~/` | X11 config | `make Xwin` |
| `zsh` | `~/` | `.zshrc`, `.zshenv` | `make zsh` |

### Agent commands

The `agents`, `gemini`, and `opencode` packages contain LLM coding agent configuration:

- **`agents/.agents/AGENTS.md`** -- shared global instructions (well-known locations, safety rules, git operations, specialized agent definitions). Gemini's `GEMINI.md` symlinks to this so both tools share the same base instructions.
- **`gemini/.gemini/commands/`** -- slash commands in TOML format (`{{args}}` for arguments)
- **`opencode/.config/opencode/commands/`** -- slash commands in Markdown format (`$ARGUMENTS` for arguments)

Both have the same commands:

| Command | Description |
|---------|-------------|
| `/commit` | Structured commit with fixup detection, unstaged handling, show-diff-before-commit |
| `/init_work` | Create gameplan file for a work item, commit it, tell user to review |
| `/start_work` | Read gameplan, execute tasks, commit gameplan after each task, checkpoint with user |

## Usage

```bash
# Install everything
make install

# Install a single package
make vim
make gemini

# Stow scripts (goes to ~/work_space/scripts/)
make scripts

# Remove all symlinks
make clean

# Remove a single package
make clean-vim
```

Or use stow directly:

```bash
stow -t $HOME <package>

# Examples
stow -t /home/sohom config
stow -t /home/sohom/work_space/scripts scripts
```

## Work laptop notes

The `opencode` package is **not symlinked** on my work laptop. It's excluded from the Makefile `PACKAGES` list because the work machine has a separate `~/.config/opencode/` with company-specific configuration (Jira ticket ID in commit messages, internal MCP servers, company-specific slash commands). The dotfiles version contains only the generic commands.

To install opencode on a personal machine, stow it manually:

```bash
stow -t $HOME opencode
```
