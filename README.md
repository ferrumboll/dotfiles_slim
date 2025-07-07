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

```json
{
  "dotfiles.repository": "https://github.com/ferrumboll/dotfiles",
  "terminal.integrated.defaultProfile.linux": "fish",
  "terminal.integrated.profiles.linux": {
    "fish": {
      "path": "fish"
    },
    "tmux": {
      "path": "tmux",
      "icon": "terminal-tmux"
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

### Core Development Tools

- **neovim** - Modern Vim-based text editor with extensive plugin support
- **nodejs_22** - Node.js runtime (specifically for Copilot nvim integration)

### File Management & Search

- **fd** - Fast and user-friendly alternative to `find`
- **ripgrep** - Ultra-fast text search tool (grep alternative)
- **fzf** - Command-line fuzzy finder for interactive filtering
- **eza** - Modern replacement for `ls` with better defaults and colors

### Version Control & Git Tools

- **lazygit** - Terminal UI for git commands with intuitive interface
- **gh** - GitHub CLI for repository management and workflows

### Python Development

- **black** - Uncompromising Python code formatter
- **pylint** - Python static code analysis tool
- **isort** - Python import sorting utility

### Terminal & Shell Enhancement

- **fish** - User-friendly command line shell
- **tmux** - Terminal multiplexer for session management
- **zellij** - Modern terminal workspace with built-in multiplexer
- **starship** - Cross-shell prompt with customizable themes
- **zoxide** - Smarter cd command that learns your habits
- **atuin** - Shell history replacement with sync capabilities

### Cloud & Infrastructure

- **awscli2** - Amazon Web Services command line interface

## Nix Configuration Features

### Global Settings (`nix/nix.conf`)
- **Experimental Features**: Enables flakes and new nix command interface
- **Flakes**: Modern Nix package management with reproducible builds
- **Nix Command**: Enhanced CLI experience

### Package Settings (`nixpkgs/config.nix`)
- **allowUnfree**: Permits installation of proprietary software
- **allowUnsupportedSystem**: Enables packages on non-standard systems

