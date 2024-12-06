function tree --description=""
    set -l args $argv

    # Check if --level flag is present in the arguments
    if not contains -- --level $args
        set args --level 1 $args
    end

    eza --long --tree --no-user -h --no-permissions --no-time -s size --total-size $args
end
