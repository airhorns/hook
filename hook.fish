set -x fish_hook_path (dirname (status -f))

# Bootstrap hook by enabling itsself.
function bootstrap
  set --local hook_function_path $fish_hook_path/hook/functions
  set --local hook_complete_path $fish_hook_path/hook/completes

  if not contains $hook_function_path $fish_function_path
    set fish_function_path $fish_function_path $hook_function_path
  end

  if not contains $hook_complete_path $fish_complete_path
    set fish_complete_path $fish_complete_path $hook_complete_path
  end
end

bootstrap
fish_hook_enable hook
