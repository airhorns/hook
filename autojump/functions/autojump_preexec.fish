function autojump_preexec
  if test $AUTOJUMP_KEEP_SYMLINKS == "1"
    set --local pwd_args ""
  else
    set --local pwd_args "-P"
  end
  autojump -a (pwd $pwd_args); and echo "done"
end
