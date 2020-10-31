rm ~/.zcompdump*

export ZSH="/home/wls/.oh-my-zsh"
export SDKMAN_DIR=/home/wls/.sdkman
export PATH=$PATH:/home/wls/Programs/gradle/bin
export PATH=$PATH:/home/wls/Programs/groovy/bin
export PATH=$PATH:/usr/lib/jvm/jdk-12.0.2/bin
export PATH=$PATH:/home/wls/Programs/chromedriver
export PATH=$PATH:/home/wls/Programs/evans
export PATH=$PATH:/home/wls/Programs/kafka/bin
export PATH=$PATH:/home/wls/.local/bin
export JAVA_HOME=/usr/lib/jvm/jdk-12.0.2
export GROOVY_HOME=/home/wls/Programs/groovy

ZSH_THEME="agnoster"

plugins=(vi-mode z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip colorize fzf
  mongodb zsh-completions gcloud helm kafka-zsh-completions zsh-abbr npm node)

source $ZSH/oh-my-zsh.sh

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

[[ -s "/home/wls/Crypto/Resources/conf/zshrc" ]] && source "/home/wls/Crypto/Resources/conf/zshrc"
#[[ -s "/home/wls/.sdkman/bin/sdkman-init.sh" ]] && source "/home/wls/.sdkman/bin/sdkman-init.sh"
#[[ -s "/home/wls/Projects/my/conf/helpers/certs.sh" ]] && source "/home/wls/Projects/my/conf/helpers/certs.sh"
[[ -s "/home/wls/Projects/my/conf/helpers/common.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/common.zsh"
#[[ -s "/home/wls/Projects/my/conf/helpers/devops.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/devops.zsh"
[[ -s "/home/wls/Projects/my/conf/helpers/docker.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/docker.zsh"
[[ -s "/home/wls/Projects/my/conf/helpers/git.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/git.zsh"
[[ -s "/home/wls/Projects/my/conf/helpers/gradle.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/gradle.zsh"
[[ -s "/home/wls/Projects/my/conf/helpers/k8s.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/k8s.zsh"
#[[ -s "/home/wls/Projects/my/conf/helpers/media.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/media.zsh"
#[[ -s "/home/wls/Projects/my/conf/helpers/vm.zsh" ]] && source "/home/wls/Projects/my/conf/helpers/vm.zsh"
