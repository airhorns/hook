function log_directories --on-variable PWD
  autojump_preexec
end

# determine the data directory according to the XDG Base Directory Specification
if [ $XDG_DATA_HOME != "" ]; and [ $XDG_DATA_HOME =~ $USER ]
    set -xg AUTOJUMP_DATA_DIR "$XDG_DATA_HOME/autojump"
else
    set -xg AUTOJUMP_DATA_DIR "$HOME/.local/share/autojump"
end

if not test -d "$AUTOJUMP_DATA_DIR"
  mkdir -p "$AUTOJUMP_DATA_DIR"
end

if not set --query AUTOJUMP_KEEP_SYMLINKS
  set -xg AUTOJUMP_KEEP_SYMLINKS 1
end
