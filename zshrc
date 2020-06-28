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
alias ksc='kubectl config use-context'
alias kgc='kubectl config get-contexts'
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
alias gb='./gradlew clean build --parallel'
alias gi='./gradlew buildImage --parallel'
alias gt='./gradlew test --parallel'
alias gr='./gradlew release -Prelease.useAutomaticVersion=true'
alias gtasks='./gradlew tasks --all -q > /home/wls/.gradle_tasks' # caches current tasks of the project
alias gtask='./gradlew :$(cat /home/wls/.gradle_tasks | fzf | cut -d " " -f1)' # runs the task that you choose in fzf
alias gajava='git add \*.java'
alias gasql='git add \*.sql'
alias gaproto='git add \*.proto'
alias gaprops='git add \*.properties'
alias gpcb='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gccb='git rev-parse --abbrev-ref HEAD | xclip -selection c'
alias gdev='git checkout develop'
alias gicc='git checkout -- .'
alias gic='git checkout --'
alias gidh='git diff HEAD'
alias now='date +%s%3N'
alias kdev='kubectl -n develop'
alias ktest='kubectl -n test'
alias jmx='java -jar /home/wls/Programs/jmxterm/jmxterm.jar'
alias tf='terraform'


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

function gen_ca_key {
    openssl genrsa -out ${key_file:-"ca-key.pem"} 4096
}

function gen_ca_cert {
    key_file_arg=${key_file:-"ca-key.pem"}
    cert_file_arg=${cert_file:-"ca-cert.pem"}
    subj_arg=${subj:-"/C=EE/ST=Harju/L=Tallinn/O=Viktor Vlasov/OU=Viktor Vlasov/CN=viktorvlasov.com"}
    openssl req -new -x509 -key $key_file_arg -out $cert_file_arg -subj $subj_arg
}

function req_cert {
    csr_arg=${csr_file:-"csr.pem"}
    config_arg=${config_file:-"csr.config"}
    key_arg=${key_file:-"key.pem"}
    openssl req -new -out $csr_arg -keyout $key_arg -config $config_arg
}

function sign_cert {
    csr_arg=${csr_file:-"csr.pem"}
    ca_cert_arg=${ca_cert_file:-"ca-cert.pem"}
    ca_key_arg=${ca_key_file:-"ca-key.pem"}
    cert_arg=${cert_file:-"cert.pem"}
    openssl x509 -req -in $csr_arg -CA $ca_cert_arg -CAkey $ca_key_arg -out $cert_arg
}
