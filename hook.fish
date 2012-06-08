set -x fish_hook_path (dirname (status -f))

# Bootstrap hook by enabling itsself.
set fish_function_path $fish_function_path $fish_hook_path/hook/functions
set fish_complete_path $fish_complete_path $fish_hook_path/hook/completions

fish_hook_enable hook
