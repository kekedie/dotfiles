# -----------------------------------------------
# history
# -----------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
function history-all { history -E 1 }

# -----------------------------------------------
# prompt
# -----------------------------------------------
setopt prompt_subst
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
autoload -U colors && colors
autoload -U compinit && compinit
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least


zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true


if is-at-least 4.3.10; then
    zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u %m'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    zstyle ':vcs_info:git:*' check-for-changes true
fi

if is-at-least 4.3.11; then
    zstyle ':vcs_info:git+set-message:*' hooks \
                                         git-hook-begin \
                                         git-untracked \
                                         git-push-status \
                                         git-nomerge-branch \
                                         git-stash-count
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            return 1
        fi

        return 0
    }

    function +vi-git-untracked() {
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then

            hook_com[unstaged]+='?'
        fi
    }

    function +vi-git-push-status() {
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" != "master" ]]; then
            return 0
        fi

        local ahead
        ahead=$(command git rev-list origin/master..master 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            hook_com[misc]+="(p${ahead})"
        fi
    }

    function +vi-git-nomerge-branch() {
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" == "master" ]]; then
            return 0
        fi

        local nomerged
        nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

        if [[ "$nomerged" -gt 0 ]] ; then
            hook_com[misc]+="(m${nomerged})"
        fi
    }


    function +vi-git-stash-count() {
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
            hook_com[misc]+=":S${stash}"
        fi
    }

fi

function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        prompt=""
    else
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        prompt="${(j: :)messages}"
    fi

    RPROMPT="[%~] $prompt"
}
add-zsh-hook precmd _update_vcs_info_msg
# PROMPT='[%F{blue}%B%n%b%f@%F{green}%U%m%u%f]$ '
PROMPT='[%n@%m]$ '
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# -----------------------------------------------
# alias command
# -----------------------------------------------
setopt complete_aliases
alias ll="ls -alh"
alias ls="ls -G"
# git alias
alias g="git"
alias glog="git log --color --decorate --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd="git diff --color"
alias gst="git status"
# ruby alias
alias be="bundle exec"

# -----------------------------------------------
# source zsh-completions
# -----------------------------------------------
fpath=(~/.zsh/bundle/zsh-completions/src $fpath)

# -----------------------------------------------
# source zsh-syntax-highlighting
# -----------------------------------------------
if [ -f ~/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -----------------------------------------------
# python
# -----------------------------------------------
if [ -d $HOME/.virtualenvs ]; then
    export WORKON_HOME=$HOME/.virtualenvs
fi

if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

eval "$(rbenv init -)"

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
