{
  packageOverrides = pkgs: with pkgs; {
    dotfiles = pkgs.buildEnv {
      name = "dotfiles-tools";
      paths = [
        neovim
        fd
        ripgrep
        fzf
        lazygit
        black
        pylint
        isort
        zellij
        zoxide
        eza
        awscli2
	atuin
        fish
        tmux
        starship
        gh
        nodejs_22 # for copilot nvim
      ];
    };
  };
}
