function develop --description="" --wraps="nix develop"
    set command ""

    # Parse arguments
    for arg in $argv
        if [ $arg = -c ]
            set command -c
        else if [ $command = -c ]
            set command "-c $arg"
        end
    end

    if [ "$argv" = -i ]
        env ANY_NIX_SHELL_PKGS=(basename (pwd))"#"(git describe --tags --dirty) (type -P nix) develop --command fish
    end

    switch $IN_NIX_SHELL
        case ""
            if [ "$command" = "" ]
                env ANY_NIX_SHELL_PKGS=(basename (pwd))"#"(git describe --tags --dirty) (type -P nix) develop --command fish
            else
                env ANY_NIX_SHELL_PKGS=(basename (pwd))"#"(git describe --tags --dirty) (type -P nix) develop --command fish $command
            end
        case "*"
            echo "Already in a nix shell"
    end
end
