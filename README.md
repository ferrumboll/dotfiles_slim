# Development Environment Configuration

This repository contains configuration files for a comprehensive development environment using Nix package management. The setup is designed to provide a consistent, reproducible development experience across different systems.

## Usage

This configuration creates a unified development environment suitable for:
- **Web Development** (Node.js, modern tooling)
- **Python Development** (formatting, linting, analysis)
- **DevOps & Cloud** (AWS CLI, terminal multiplexers)
- **General Programming** (Git workflows, file search, text editing)

The environment emphasizes modern alternatives to traditional Unix tools, providing enhanced user experience while maintaining compatibility and performance.

## Installation

### DevContainer Setup

To use this configuration in a DevContainer, add the following to your `.devcontainer/devcontainer.json`:

You need to have the `ghcr.io/devcontainers/features/nix:1` feature:

```json
{
  ...
  "features": {
    ...
    "ghcr.io/devcontainers/features/nix:1": {}
  },
  ...
  "customizations": {
    "vscode": {
      ...
      "settings": {
        ...
        "dotfiles.repository": "https://github.com/ferrumboll/dotfiles_slim",
        "terminal.integrated.defaultProfile.linux": "fish",
        "terminal.integrated.profiles.linux": {
          "fish": {
            "path": "fish"
          }
        }
        ...
      }
    }
  }
}
```

### Manual Installation

To use this configuration:
1. Install Nix package manager
2. Apply the configuration: `nix-env -iA nixpkgs.dotfiles`
3. Configure individual tools using their respective config files in this repository

The setup provides a complete, batteries-included development environment that works consistently across macOS, Linux, and other supported platforms.
## Nix Package Configuration

The main application bundle is defined in `config.nix` under the `dotfiles` environment, which includes the following tools:

### Version Control & Git Tools

- **lazygit** - Terminal UI for git commands with intuitive interface
- **gh** - GitHub CLI for repository management and workflows

### Terminal & Shell Enhancement

- **fish** - User-friendly command line shell
- **starship** - Cross-shell prompt with customizable themes
- **zoxide** - Smarter cd command that learns your habits
- **atuin** - Shell history replacement with sync capabilities

### Cloud & Infrastructure

- **awscli2** - Amazon Web Services command line interface

### File Management & Search

- **fd** - Fast and user-friendly alternative to `find`
- **ripgrep** - Ultra-fast text search tool (grep alternative)
- **fzf** - Command-line fuzzy finder for interactive filtering
- **eza** - Modern replacement for `ls` with better defaults and colors

### Python Development

- **black** - Uncompromising Python code formatter
- **pylint** - Python static code analysis tool
- **isort** - Python import sorting utility

## Nix Configuration Features

### Global Settings (`nix/nix.conf`)
- **Experimental Features**: Enables flakes and new nix command interface
- **Flakes**: Modern Nix package management with reproducible builds
- **Nix Command**: Enhanced CLI experience

### Package Settings (`nixpkgs/config.nix`)
- **allowUnfree**: Permits installation of proprietary software
- **allowUnsupportedSystem**: Enables packages on non-standard systems

## Tool Documentation

### Fish Shell

**What it is**: Fish (Friendly Interactive Shell) is a smart and user-friendly command line shell with syntax highlighting, autosuggestions, and tab completions that work out of the box.

**Documentation**: [https://fishshell.com/docs/current/](https://fishshell.com/docs/current/)

### Starship Prompt

**What it is**: Starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell. It shows contextual information about your current directory, git status, programming languages, and more.

**How it's used**: Starship automatically detects your development environment and displays relevant information in your prompt. It works across all shells and provides consistent theming.

**Documentation**: [https://starship.rs/](https://starship.rs/)

### Zoxide

**What it is**: Zoxide is a smarter cd command that learns your habits. It remembers which directories you use most frequently and allows you to jump to them with just a few keystrokes.

**How it's used**: After using directories normally, zoxide builds a database of your most-used paths. You can then jump to directories using partial names or fuzzy matching.

**Basic commands**:
```bash
# Jump to a directory (replaces cd)
z documents
z doc
z ~/proj/my-app
```

**Documentation**: [https://github.com/ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide)

### Atuin

**What it is**: Atuin replaces your existing shell history with a SQLite database, providing better search, context, and optional encrypted synchronization across machines.

**How it's used**: You just need to press `up` in your keyboard and you are already using atuin!

**Documentation**: [https://github.com/atuinsh/atuin](https://github.com/atuinsh/atuin)

### Lazygit

**What it is**: Lazygit is a simple terminal UI for git commands. It provides an intuitive interface for common git operations without needing to remember complex command syntax.

**How it's used**: Launch lazygit in any git repository to get a visual interface for staging, committing, branching, merging, and other git operations.

**Basic commands**:
```bash
# Launch lazygit in current repository
lazygit

# Key bindings within lazygit:
# j/k - navigate up/down
# space - stage/unstage files
# c - commit
# P - push
# p - pull
# b - branch menu
# m - merge
# r - rebase
# ? - help menu
```

**Documentation**: [https://github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)

### GitHub CLI (gh)

**What it is**: GitHub CLI brings GitHub functionality to your terminal. You can manage repositories, issues, pull requests, and workflows without leaving the command line.

**How it's used**: Authenticate with GitHub and perform repository operations, create PRs, manage issues, and interact with GitHub Actions directly from your terminal.

**Basic commands**:
```bash
# Authenticate with GitHub
gh auth login

# Clone a repository
gh repo clone owner/repo

# Create a new repository
gh repo create my-new-repo

# Create a pull request
gh pr create --title "My PR" --body "Description"

# List pull requests
gh pr list

# View issues
gh issue list

# Create an issue
gh issue create --title "Bug report" --body "Description"

# View repository information
gh repo view

# Run GitHub Actions workflow
gh workflow run workflow.yml
```

**Documentation**: [https://cli.github.com/manual/](https://cli.github.com/manual/)

