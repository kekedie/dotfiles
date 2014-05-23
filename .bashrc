# -----------------------------------------------
# git alias
# -----------------------------------------------
alias g="git"
alias gl="git log --color --decorate --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd="git diff --color"
alias gg="git status -s"

# -----------------------------------------------
# rbenv
# -----------------------------------------------
eval "$(rbenv init -)"

# -----------------------------------------------
# key configuration
# -----------------------------------------------
stty stop undef

# -----------------------------------------------
# tmux configuration
# -----------------------------------------------
alias tmux="TERM=screen-256color-bce tmux"

if [ -z "$TMUX" -a -z "$STY" ]; then
  if type tmux >/dev/null 2>&1; then
    if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
      tmux attach && echo "tmux attached session "
    else
      tmux new-session && echo "tmux created new session"
    fi
  fi
fi 
