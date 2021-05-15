rm ~/.zcompdump*

export ZSH="/home/wls/.oh-my-zsh"
export SDKMAN_DIR=/home/wls/.sdkman
export PATH=$PATH:/home/wls/Programs/gradle/bin
export PATH=$PATH:/home/wls/Programs/groovy/bin
export PATH=$PATH:/usr/lib/jvm/jdk-12.0.2/bin
export PATH=$PATH:/home/wls/Programs/chromedriver
export PATH=$PATH:/home/wls/Programs/evans
export PATH=$PATH:/home/wls/Programs/kafka/bin
export PATH=$PATH:/home/wls/Programs/node/bin
export PATH=$PATH:/home/wls/Programs/mongoshell
export PATH=$PATH:/home/wls/Programs/go/bin
export PATH=$PATH:/home/wls/Programs/istio/bin
export PATH=$PATH:/home/wls/Programs/filebeat
export PATH=$PATH:/home/wls/Programs/geckodriver
export PATH=$PATH:/home/wls/.local/bin
export JAVA_HOME=/usr/lib/jvm/jdk-12.0.2
export GROOVY_HOME=/home/wls/Programs/groovy
export GPG_TTY=$(tty)
export MY_CONF_HOME=/home/wls/Projects/my/conf

ZSH_THEME="agnoster"

plugins=(vi-mode z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl kubetail minikube python pip colorize fzf
  mongodb zsh-completions gcloud helm kafka-zsh-completions zsh-abbr npm node)

source $ZSH/oh-my-zsh.sh

fpath+=(~/.config/hcloud/completion/zsh)

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

[[ -s "/home/wls/Crypto/Resources/conf/zshrc" ]] && source "/home/wls/Crypto/Resources/conf/zshrc"
#[[ -s "/home/wls/.sdkman/bin/sdkman-init.sh" ]] && source "/home/wls/.sdkman/bin/sdkman-init.sh"
#[[ -s "$MY_CONF_HOME/helpers/certs.sh" ]] && source "$MY_CONF_HOME/helpers/certs.sh"
[[ -s "$MY_CONF_HOME/helpers/common.zsh" ]] && source "$MY_CONF_HOME/helpers/common.zsh"
[[ -s "$MY_CONF_HOME/helpers/devops.zsh" ]] && source "$MY_CONF_HOME/helpers/devops.zsh"
[[ -s "$MY_CONF_HOME/helpers/docker.zsh" ]] && source "$MY_CONF_HOME/helpers/docker.zsh"
[[ -s "$MY_CONF_HOME/helpers/git.zsh" ]] && source "$MY_CONF_HOME/helpers/git.zsh"
[[ -s "$MY_CONF_HOME/helpers/gradle.zsh" ]] && source "$MY_CONF_HOME/helpers/gradle.zsh"
[[ -s "$MY_CONF_HOME/helpers/k8s.zsh" ]] && source "$MY_CONF_HOME/helpers/k8s.zsh"
#[[ -s "$MY_CONF_HOME/helpers/media.zsh" ]] && source "$MY_CONF_HOME/helpers/media.zsh"
#[[ -s "$MY_CONF_HOME/helpers/vm.zsh" ]] && source "$MY_CONF_HOME/helpers/vm.zsh"

[[ -s "/home/wls/Scripts/words.py" ]] && python3 "/home/wls/Scripts/words.py"
