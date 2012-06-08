function fish_hook_list_available_hooks
  pushd $fish_hook_path
  ls -d1 -- */ | rev | cut -c 2- | rev
  popd
end
