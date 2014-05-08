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
