{
  packageOverrides = pkgs: with pkgs; {
    dotfiles = pkgs.buildEnv {
      name = "dotfiles-tools";
      paths = [
        lazygit
        zoxide
        eza
        awscli2
	atuin
        fish
        starship
        gh
        opencommit

        bat
        fd
        ripgrep
        fzf

        black
        pylint
        isort
      ];
    };
  };
}
