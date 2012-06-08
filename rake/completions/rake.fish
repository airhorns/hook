complete -f -c rake -a '(rake -T | sed -E "s/\w+ ([^ \[]+).+/\1/")' -d 'Task'
