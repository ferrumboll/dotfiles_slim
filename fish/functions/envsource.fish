function envsource --description=""
  set -f envfile "$argv"
  if not test -f $envfile
    echo "File not found: $envfile"
    return 1
  end

  while read line
    if not string match -qr '^#|^$' line
      set item (string split -m1 '=' $line)
      set -gx $item[1] $item[2]
      echo "Exported $item[1]"
    end
  end <"$envfile"
end
