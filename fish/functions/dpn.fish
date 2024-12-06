function dpn --description="DevPod open nvim in <pod>" -a pod
  ssh -t $pod.devpod nvim .
end
