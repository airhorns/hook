function __fish_rbenv_commands
  rbenv commands
end

function __fish_rbenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_rbenv_completions_for_command
  rbenv completions $argv
end

complete -f -A -c rbenv -a "(__fish_rbenv_commands)"

for rbenv_command in (__fish_rbenv_commands)
  complete -f -A -c rbenv -n "__fish_rbenv_using_command $rbenv_command" -a "(__fish_rbenv_completions_for_command $rbenv_command)"
end
