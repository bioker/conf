rm ~/.zcompdump*

export ZSH="/home/wls/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(vi-mode z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip colorize fzf
  mongodb zsh-completions gcloud helm kafka-zsh-completions)

source $ZSH/oh-my-zsh.sh

compdef _VBoxManage vm
compdef _VBoxHeadless vmh

alias e='vim ~/.zshrc'
alias s='source ~/.zshrc'
alias k='kubectl'
alias d='sudo docker'
alias dps='sudo docker ps'
alias dip="sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias dex="sudo docker exec -it"
alias dl="sudo docker logs"
alias ds='sudo docker stop'
alias dsa='sudo docker stop $(sudo docker ps -qa)'
alias jc='jupyter console'
alias vm='VBoxManage'
alias vmh='VBoxHeadless'
alias gb='./gradlew clean build -x test --parallel'
alias gi='./gradlew buildImage -x test --parallel'
alias gt='./gradlew test --parallel'
alias gr='./gradlew release -Prelease.useAutomaticVersion=true'
alias gtasks='./gradlew tasks --all -q > /home/wls/.gradle_tasks' # caches current tasks of the project
alias gtask='./gradlew :$(cat /home/wls/.gradle_tasks | fzf | sed -n -e "s/^\(.*\) - .*/\1/p")' # runs the task that you choose in fzf
alias gajava='git add \*.java'
alias gasql='git add \*.sql'
alias gaproto='git add \*.proto'
alias gaprops='git add \*.properties'
alias gpcb='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gccb='git rev-parse --abbrev-ref HEAD | xclip -selection c'
alias gdev='git checkout develop'
alias gicc='git checkout -- .'
alias gic='git checkout --'
alias now='date +%s%3N'
alias kdev='kubectl -n develop'
alias ktest='kubectl -n test'
alias jmx='java -jar /home/wls/Programs/jmxterm/jmxterm.jar'


export PATH=$PATH:/home/wls/Programs/gradle/bin
export PATH=$PATH:/home/wls/Programs/groovy/bin
export PATH=$PATH:/usr/lib/jvm/jdk-12.0.2/bin
export PATH=$PATH:/home/wls/Programs/chromedriver
export PATH=$PATH:/home/wls/Programs/evans
export PATH=$PATH:/home/wls/Programs/kafka/bin
export JAVA_HOME=/usr/lib/jvm/jdk-12.0.2
export GROOVY_HOME=/home/wls/Programs/groovy

function agsed {
    ag -l $1 | xargs sed -i -e "s/$1/$2/g"
}
