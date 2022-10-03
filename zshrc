start_millis=$(date +%s%3N)

export ZSH="/home/wls/.oh-my-zsh"
export PATH=$PATH:/home/wls/.local/bin
export GPG_TTY=$(tty)
export MY_CONF_HOME=/home/wls/Projects/Personal/conf

[[ ! -s "/home/wls/.oh-my-zsh/themes/agnoster-light.zsh-theme" ]] && wget -O /home/wls/.oh-my-zsh/themes/agnoster-light.zsh-theme https://raw.githubusercontent.com/mkolosick/agnoster-light/master/agnoster-light.zsh-theme

export ZSH_THEME="agnoster"
#export ZSH_THEME="agnoster-light"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

plugins=(z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip colorize fzf
  mongodb zsh-completions gcloud helm zsh-abbr npm node terraform)

source $ZSH/oh-my-zsh.sh

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

command -v flux >/dev/null && . <(flux completion zsh)

[[ -s "$MY_CONF_HOME/helpers/certs.sh" ]]    && source "$MY_CONF_HOME/helpers/certs.sh"
[[ -s "$MY_CONF_HOME/helpers/program.zsh" ]] && source "$MY_CONF_HOME/helpers/program.zsh"
[[ -s "$MY_CONF_HOME/helpers/secrets.zsh" ]] && source "$MY_CONF_HOME/helpers/secrets.zsh"
[[ -s "$MY_CONF_HOME/helpers/common.zsh" ]]  && source "$MY_CONF_HOME/helpers/common.zsh"
[[ -s "$MY_CONF_HOME/helpers/devops.zsh" ]]  && source "$MY_CONF_HOME/helpers/devops.zsh"
[[ -s "$MY_CONF_HOME/helpers/git.zsh" ]]     && source "$MY_CONF_HOME/helpers/git.zsh"
[[ -s "$MY_CONF_HOME/helpers/gradle.zsh" ]]  && source "$MY_CONF_HOME/helpers/gradle.zsh"
[[ -s "$MY_CONF_HOME/helpers/k8s.zsh" ]]     && source "$MY_CONF_HOME/helpers/k8s.zsh"

end_millis=$(date +%s%3N)
echo "shell loaded in $((end_millis - start_millis)) milliseconds"

[[ -s "/home/wls/Scripts/words.py" ]] && python3 "/home/wls/Scripts/words.py"
