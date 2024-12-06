function dp --description="DevPod interactions dp <pod> [n|shell|-c command]" -a pod cmd
  if test -z $pod
    echo "Usage: dp <pod> [n|shell|-c command]"
    echo "  n: open nvim"
    echo "  shell: open shell"
    echo "  -c command: run command"
    echo "Example: dp dbt_intro n # ssh -t dbt_intro.devpod nvim"
    echo "       dp dbt_intro shell # ssh dbt_intro.devpod"
    echo "       dp dbt_intro # ssh dbt_intro.devpod"
    return 1
  end

  if test -z $cmd
    ssh -t $pod.devpod fish
  else if test $cmd = "n"
    ssh -t $pod.devpod nvim .
  else if test $cmd = "shell"
    ssh $pod.devpod fish
  else if test $cmd = "-c"
    ssh -t $pod.devpod $argv[3..-1]
  else
    echo "Invalid command: $cmd"
    return 1
  end
end
