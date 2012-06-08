function fish_hook_list_available_hooks
  ls -l $fish_hook_path | grep "^d" | cut -f 13 -d " "
end
