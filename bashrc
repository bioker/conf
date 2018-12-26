# prompt
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\]:\[\e[33m\]\w \[\e[m\]\\$ "

# color terminal
case "$TERM" in
    xterm*)
        export TERM=xterm-256color
        ;;
esac

# time style
export TIME_STYLE=long-iso

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tmux='tmux -u'

# developer environment
## JDK
export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
