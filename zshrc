rm ~/.zcompdump*

export ZSH="/home/wls/.oh-my-zsh"
export PATH=$PATH:/home/wls/Programs/evans
export PATH=$PATH:/home/wls/Programs/node/bin
export PATH=$PATH:/home/wls/.local/bin
export PATH=$PATH:/usr/lib/jvm/jdk-12.0.2/bin
export PATH=$PATH:/home/wls/Programs/go/bin
export JAVA_HOME=/usr/lib/jvm/jdk-12.0.2
export GPG_TTY=$(tty)
export MY_CONF_HOME=/home/wls/Projects/Personal/conf

ZSH_THEME="agnoster"

plugins=(z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip colorize fzf
  mongodb zsh-completions gcloud helm zsh-abbr npm node terraform)

source $ZSH/oh-my-zsh.sh

fpath+=(~/.config/hcloud/completion/zsh)

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

command -v flux >/dev/null && . <(flux completion zsh)

[[ -s "/home/wls/Resources/BetPawa/conf/zshrc" ]] && source "/home/wls/Resources/BetPawa/conf/zshrc"
#[[ -s "$MY_CONF_HOME/helpers/certs.sh" ]] && source "$MY_CONF_HOME/helpers/certs.sh"
[[ -s "$MY_CONF_HOME/helpers/common.zsh" ]] && source "$MY_CONF_HOME/helpers/common.zsh"
[[ -s "$MY_CONF_HOME/helpers/devops.zsh" ]] && source "$MY_CONF_HOME/helpers/devops.zsh"
[[ -s "$MY_CONF_HOME/helpers/git.zsh" ]] && source "$MY_CONF_HOME/helpers/git.zsh"
[[ -s "$MY_CONF_HOME/helpers/gradle.zsh" ]] && source "$MY_CONF_HOME/helpers/gradle.zsh"
[[ -s "$MY_CONF_HOME/helpers/k8s.zsh" ]] && source "$MY_CONF_HOME/helpers/k8s.zsh"

[[ -s "/home/wls/Scripts/words.py" ]] && python3 "/home/wls/Scripts/words.py"

complete -o nospace -C /usr/bin/consul consul
complete -o nospace -C /usr/bin/nomad nomad

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
