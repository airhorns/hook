function autojump_preexec
  if test "1" = $AUTOJUMP_KEEP_SYMLINKS
    set --local pwd_args ""
  else
    set --local pwd_args "-P"
  end
  autojump -a (pwd $pwd_args)
end
