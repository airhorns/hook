function fish_hook_enable
  set available_hooks (fish_hook_list_available_hooks)
  for hook in $argv
    if not contains $hook $available_hooks
      echo "Can't enable hook $hook because it can't be found!"
      return 1
    end
  end

  for hook in $argv
    if test $hook = "hook"
      # hook's own paths are added during bootstrap
      continue
    end

    if not contains $hook fish_hook_enabled_hooks
      set fish_function_path $fish_function_path (fish_hook_function_path $hook)
      set fish_complete_path $fish_complete_path (fish_hook_completion_path $hook)
    end
  end

  set -x fish_hook_enabled_hooks $fish_hook_enabled_hooks $argv
  return 0
end
