function j
  set input $argv[1]
  if test $input == -*
		autojump $input
		return 0
	end

  set new_path (autojump $input)

  if test -d $new_path
    printf '%s%s%s\n' (set_color magenta) $new_path (set_color normal)
      builtin cd $new_path
  else
      echo "autojump: directory '$new_path' not found"
      echo "Try `autojump --help` for more information."
      return 1
  end
end

function __fish_j_directories
  autojump --completion --bash (commandline -p | cut -c 3-)
end

complete -f -A -c j -a "(__fish_j_directories)" -d "Autojump to a directory"
