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
alias groovyd='groovy -Dgroovy.grape.report.downloads=true'

# developer environment
## JDK
export JAVA_HOME="$HOME/dev/jdk1.8.0_131"
export PATH="$PATH:$JAVA_HOME/bin"
## Groovy
export GROOVY_HOME="$HOME/dev/groovy-2.4.10"
export PATH="$PATH:$GROOVY_HOME/bin"
## Maven
export MAVEN_HOME="$HOME/dev/apache-maven-3.5.0"
export PATH="$PATH:$MAVEN_HOME/bin"
## Gradle
export GRADLE_HOME="$HOME/dev/gradle-3.5"
export PATH="$PATH:$GRADLE_HOME/bin"
## Node JS
export PATH="$PATH:$HOME/dev/node-v6.10.3-linux-x64/bin"
## MongoDB
export PATH="$PATH:$HOME/dev/mongodb-linux-x86_64-debian81-3.4.4/bin"
## Exercism
export PATH="$PATH:$HOME/dev/exercism"
## IDEA
export PATH="$PATH:$HOME/dev/idea-IC-171.4424.56/bin"
## TomEE
export CATALINA_HOME="$HOME/dev/apache-tomee-plus-7.0.3"
export PATH="$PATH:$CATALINA_HOME/bin"
## Mule ESB
export MULE_HOME="$HOME/dev/mule-standalone-3.7.0"
export PATH="$PATH:$MULE_HOME/bin"
## WildFly
export JBOSS_HOME="$HOME/dev/wildfly-10.1.0.Final"
export PATH="$PATH:$JBOSS_HOME/bin"
## SqlCl
export PATH="$PATH:$HOME/dev/sqlcl/bin"
## Java EE SDK
export PATH="$PATH:$HOME/dev/glassfish4/bin"
## Java EE SDK Glassfish
export PATH="$PATH:$HOME/dev/glassfish4/glassfish/bin"

# screen setup
if [ -f ~/.myscreenrc ]; then
    . ~/.myscreenrc
fi

# scripts
if [ -f ~/.myscripts.sh ]; then
    . ~/.myscripts.sh
fi

# exercism cli completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
    . ~/.config/exercism/exercism_completion.bash
fi
