start_millis=$(date +%s%3N)

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.tfenv/bin
export PATH=$PATH:$HOME/.tiup/bin
export GPG_TTY=$(tty)
export MY_CONF_HOME=$HOME/Projects/Personal/conf

[[ ! -s "$HOME/.oh-my-zsh/themes/agnoster-light.zsh-theme" ]] && wget -O $HOME/.oh-my-zsh/themes/agnoster-light.zsh-theme https://raw.githubusercontent.com/mkolosick/agnoster-light/master/agnoster-light.zsh-theme

export ZSH_THEME="agnoster"
#export ZSH_THEME="agnoster-light"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

plugins=(z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip colorize fzf
  mongodb zsh-completions kafka-zsh-completions gcloud helm zsh-abbr npm node terraform)

source $ZSH/oh-my-zsh.sh

command -v flux >/dev/null && . <(flux completion zsh)
command -v hcloud >/dev/null && . <(hcloud completion zsh)
command -v tiup >/dev/null && . <(tiup completion zsh)

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

[[ -s "$MY_CONF_HOME/helpers/certs.sh" ]]    && source "$MY_CONF_HOME/helpers/certs.sh"
[[ -s "$MY_CONF_HOME/helpers/program.zsh" ]] && source "$MY_CONF_HOME/helpers/program.zsh"
[[ -s "$MY_CONF_HOME/helpers/secrets.zsh" ]] && source "$MY_CONF_HOME/helpers/secrets.zsh"
[[ -s "$MY_CONF_HOME/helpers/common.zsh" ]]  && source "$MY_CONF_HOME/helpers/common.zsh"
[[ -s "$MY_CONF_HOME/helpers/git.zsh" ]]     && source "$MY_CONF_HOME/helpers/git.zsh"
[[ -s "$MY_CONF_HOME/helpers/k8s.zsh" ]]     && source "$MY_CONF_HOME/helpers/k8s.zsh"

[[ ! -d "$HOME/.tfenv" ]] && git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv

end_millis=$(date +%s%3N)
echo "shell loaded in $((end_millis - start_millis)) milliseconds"

[[ -s "/var/run/reboot-required" ]] && cat /var/run/reboot-required
