export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

test -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash && source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
test -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh && source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"

export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

alias ll='ls -lah'

test -f ~/.bashrc && source ~/.bashrc
