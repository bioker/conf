rm ~/.zcompdump*

export ZSH="/home/wls/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(vi-mode z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip colorize fzf
  mongodb zsh-completions gcloud helm kafka-zsh-completions zsh-abbr)

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
abbr -S -g --force --quiet gtask='`cat /home/wls/.gradle_tasks | fzf | cut -d " " -f1`' # runs the task that you choose in fzf
abbr -S -g --force --quiet fprb='ffprobe -hide_banner'
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

function optimizevideo {
    in_file_arg=${in_file:-"video.mp4"}
    out_file_arg=${out_file:-"optimized-video.mp4"}
    resoultion_arg=${res:-"1080x720"}
    frate_arg=${rate:-"30"}
    brate_arg=${bitrate:-"3500K"}
    ffmpeg -i $in_file_arg -s $resoultion_arg -r $frate_arg -b:v $brate_arg $out_file_arg
}

function agsed {
    ag -l $1 | xargs sed -i -e "s/$1/$2/g"
}

function genkey {
    openssl genrsa -out ${key_file:-"some.key"} ${key_size:-"4096"}
}

function gencert {
    key_file_arg=${key_file:-"some.key"}
    cert_file_arg=${cert_file:-"some.crt"}
    subj_arg=${subj:-"/C=EE/ST=Harju/L=Tallinn/O=Viktor Vlasov/OU=Viktor Vlasov/CN=localhost"}
    openssl req -new -x509 -key $key_file_arg -out $cert_file_arg -subj $subj_arg
}

function gencsr {
    key_arg=${key_file:-"some.key"}
    config_arg=${config_file:-"some.config"}
    csr_arg=${csr_file:-"some.csr"}
    openssl req -new -out $csr_arg -key $key_arg -config $config_arg
}

function gensigncert {
    csr_arg=${csr_file:-"cert-request.csr"}
    ca_cert_arg=${ca_cert_file:-"ca.crt"}
    ca_key_arg=${ca_key_file:-"ca.key"}
    cert_arg=${cert_file:-"some.crt"}
    openssl x509 -req -in $csr_arg -CA $ca_cert_arg -CAkey $ca_key_arg -CAcreateserial -out $cert_arg
}

function copy2p12 {
    key_file_arg=${key_file:-"some.key"}
    cert_file_arg=${cert_file:-"some.crt"}
    p12_file_arg=${p12_file:-"some.p12"}
    openssl pkcs12 -export -out $p12_file_arg -inkey $key_file_arg -in $cert_file_arg
}

function gencakey {
    key_file=ca.key genkey
}

function genserkey {
    key_file=server.key genkey
}

function genclikey {
    key_file=client.key genkey
}

function gencacert {
    key_file=ca.key cert_file=ca.crt gencert
}

function gensercsr {
    key_file=server.key config_file=server-csr.config csr_file=server.csr gencsr
}

function genclicsr {
    key_file=client.key config_file=client-csr.config csr_file=client.csr gencsr
}

function gensercrt {
    csr_file=server.csr ca_cert_file=ca.crt ca_key_file=ca.key cert_file=server.crt gensigncert
}

function genclicrt {
    csr_file=client.csr ca_cert_file=ca.crt ca_key_file=ca.key cert_file=client.crt gensigncert
}

function prepare_ssl_files {
    gencakey
    genserkey
    genclikey
    gencacert
    gensercsr
    genclicsr
    gensercrt
    genclicrt
}

function jks2p12 {
    keytool -importkeystore -srckeystore $1 -destkeystore $2 -deststoretype PKCS12
}

function get_p12_cert {
    openssl pkcs12 -in $1 -nokeys -out $2
}

function get_p12_key {
    openssl pkcs12 -in $1 -nocerts -nodes -out $2
}
