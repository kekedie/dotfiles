# -----------------------------------------------
# git alias
# -----------------------------------------------
# alias g="git"
alias gl="git log --color --decorate --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd="git diff --color"
alias gst='git status -s'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

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
# if [[ ! $TERM =~ screen ]]; then
#   exec tmux
# fi
# alias tmux="TERM=screen-256color-bce tmux"
#
# if [ -z "$TMUX" -a -z "$STY" ]; then
#   if type tmux >/dev/null 2>&1; then
#     # if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
#     if tmux list-sessions; then
#       tmux attach && echo "tmux attached session "
#     else
#       tmux new-session && echo "tmux created new session"
#     fi
#   fi
# fi
