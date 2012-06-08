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

    if contains $hook $fish_hook_enabled_hooks
      continue
    end

    set hook_function_path (fish_hook_function_path $hook)
    set hook_completion_path (fish_hook_completion_path $hook)

    if test -f $function_path
      if not contains $hook_function_path $fish_function_path
        set fish_function_path $fish_function_path $hook_function_path
      end
    end

    if test -f $hook_completion_path
      if not contains $hook_completion_path $fish_completion_path
        set fish_complete_path $fish_completion_path $hook_completion_path
      end
    end


    set --global --export fish_hook_enabled_hooks $hook $fish_hook_enabled_hooks
  end

  return 0
end
