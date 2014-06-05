set -xg PATH "$HOME/.rbenv/shims" $PATH
if test -d "$HOME/.rbenv/bin"
  set -xg PATH "$HOME/.rbenv/bin" $PATH
end

rbenv rehash ^/dev/null
