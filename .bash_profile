export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

test -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash && source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
test -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh && source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"

export LS_OPTIONS='--color=auto'
# export CLICOLOR='Yes'
# export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
# export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Change prompt
PS1_OLD=${PS1}
export PS1='\[\033[1;34m\]\u\[\033[0m\]@\[\033[1;35m\]\h\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\] \[\033[1;92m\]$(__git_ps1 "(%s)")\[\033[0m\]$ '


# export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=512M -XX:MaxPermSize=1024M"
# unset SBT_OPTS

# ls alias for color-mode
alias ll='ls -lhaG'

# grep with color
alias grep='grep --color=auto'

# refresh shell
alias reload='source ~/.bash_profile'

test -f ~/.bashrc && source ~/.bashrc
