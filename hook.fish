set -x fish_hook_path (dirname (status -f))

# Bootstrap hook by enabling itsself.
set --local hook_function_path $fish_hook_path/hook/functions
set --local hook_completion_path $fish_hook_path/hook/completions

if not contains $hook_function_path $fish_function_path
  set fish_function_path $fish_function_path $hook_function_path
end

if not contains $hook_completion_path $fish_completion_path
  set fish_complete_path $fish_completion_path $hook_completion_path
end

fish_hook_enable hook
