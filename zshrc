export ZSH="/home/wls/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(vi-mode z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip github colorize fzf
  mongodb zsh-completions gcloud)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

alias e='vim ~/.zshrc'
alias s='source ~/.zshrc'
alias k='kubectl'
alias d='docker'
alias vm='VBoxManage'
alias gb='./gradlew clean build -x test'
alias gi='./gradlew buildImage -x test'
alias gt='./gradlew test'
alias gtasks='./gradlew tasks --all -q > /home/wls/.gradle_tasks' # caches current tasks of the project
alias gtask='./gradlew :$(cat /home/wls/.gradle_tasks | fzf | sed -n -e "s/^\(.*\) - .*/\1/p")' # runs the task that you choose in fzf
alias gajava='git add \*.java'
alias gasql='git add \*.sql'
alias gaproto='git add \*.proto'
alias gaprops='git add \*.properties'
alias gpcb='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gdev='git checkout develop'
alias gc-='git checkout -- .'
alias now='date +%s%3N'
alias kdev='kubectl -n develop'
alias ktest='kubectl -n test'

export PATH=$PATH:/home/wls/Programs/gradle/bin
export PATH=$PATH:/home/wls/Programs/groovy/bin
export PATH=$PATH:/usr/lib/jvm/jdk-12.0.2/bin
export PATH=$PATH:/home/wls/Programs/chromedriver
export PATH=$PATH:/home/wls/Programs/evans
export JAVA_HOME=/usr/lib/jvm/jdk-12.0.2
export GROOVY_HOME=/home/wls/Programs/groovy

function agsed {
    ag -l $1 | xargs sed -i -e "s/$1/$2/g"
}
