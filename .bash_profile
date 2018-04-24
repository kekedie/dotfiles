# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`

# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

MYSQL=/usr/local/Cellar/mysql56/5.6.32
PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=$MYSQL/bin:$HOME/bin:$HOME/.jenv/shims:$PATH
export PATH

export ELASTICMQ_HOME=/Users/a12590/Development/ElasticMQ
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export DYLD_LIBRARY_PATH=$MYSQL/lib:$DYLD_LIBRARY_PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,bashrc}; do
  [ -r "$file" ] && source "$file"
done
unset file

test -f $(brew --prefix)/etc/bash_completion && source $(brew --prefix)/etc/bash_completion
test -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash && source $(brew --prefix)/etc/bash_completion.d/git-completion.bash 
test -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh && source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
