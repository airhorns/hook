function __git_ps1
  set -l g (git rev-parse --git-dir ^/dev/null)
  if [ -n "$g" ]
    set -l r ""
    set -l b ""
    set -l w ""
    set -l i ""

    if [ -d "$g/../.dotest" ]
      if [ -f "$g/../.dotest/rebasing" ]
        set r "|REBASE"
      elseif [ -f "$g/../.dotest/applying" ]
        set r "|AM"
      else
        set r "|AM/REBASE"
      end

      set b (git symbolic-ref HEAD ^/dev/null)
    elseif [ -f "$g/.dotest-merge/interactive" ]
      set r "|REBASE-i"
      set b (cat "$g/.dotest-merge/head-name")
    elseif [ -d "$g/.dotest-merge" ]
      set r "|REBASE-m"
      set b (cat "$g/.dotest-merge/head-name")
    elseif [ -f "$g/MERGE_HEAD" ]
      set r "|MERGING"
      set b (git symbolic-ref HEAD ^/dev/null)
    else
      if [ -f "$g/BISECT_LOG" ]
        set r "|BISECTING"
      end

      set b (git symbolic-ref HEAD ^/dev/null)
      if [ -z $b ]
        set b (git describe --exact-match HEAD ^/dev/null)
        if [ -z $b ]
          set b (cut -c1-7 "$g/HEAD")
          set b "$b..."
        end
      end
    end

    if test "(git config --bool bash.showDirtyState)" != "false"
      git diff --no-ext-diff --quiet --exit-code; or set w "*"
      if git rev-parse --quiet --verify HEAD >/dev/null
        git diff-index --cached --quiet HEAD --; or set i "+"
      else
        set i "#"
      end
    end
    if not test $argv
        set argv " (%s%s%s%s)"
    end

    set b (echo $b | sed -e 's|^refs/heads/||')

    printf $argv "$b$r$w$i" ^/dev/null
  end
end
