rm ~/.zcompdump*

export ZSH="/home/wls/.oh-my-zsh"
export PATH=$PATH:/home/wls/.local/bin
export GPG_TTY=$(tty)
export MY_CONF_HOME=/home/wls/Projects/Personal/conf

[[ ! -s "/home/wls/.oh-my-zsh/themes/agnoster-light.zsh-theme" ]] && wget -O /home/wls/.oh-my-zsh/themes/agnoster-light.zsh-theme https://raw.githubusercontent.com/mkolosick/agnoster-light/master/agnoster-light.zsh-theme

ZSH_THEME="agnoster"

#ZSH_THEME="agnoster-light"
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23' # use for agnoster-light theme

plugins=(z git tmux zsh-syntax-highlighting zsh-autosuggestions
  docker docker-compose kubectl minikube python pip colorize fzf
  mongodb zsh-completions gcloud helm zsh-abbr npm node terraform)

source $ZSH/oh-my-zsh.sh

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

command -v flux >/dev/null && . <(flux completion zsh)

[[ -s "$MY_CONF_HOME/helpers/certs.sh" ]] && source "$MY_CONF_HOME/helpers/certs.sh"
[[ -s "$MY_CONF_HOME/helpers/program.zsh" ]] && source "$MY_CONF_HOME/helpers/program.zsh"
[[ -s "$MY_CONF_HOME/helpers/secrets.zsh" ]] && source "$MY_CONF_HOME/helpers/secrets.zsh"
[[ -s "$MY_CONF_HOME/helpers/common.zsh" ]] && source "$MY_CONF_HOME/helpers/common.zsh"
[[ -s "$MY_CONF_HOME/helpers/devops.zsh" ]] && source "$MY_CONF_HOME/helpers/devops.zsh"
[[ -s "$MY_CONF_HOME/helpers/git.zsh" ]] && source "$MY_CONF_HOME/helpers/git.zsh"
[[ -s "$MY_CONF_HOME/helpers/gradle.zsh" ]] && source "$MY_CONF_HOME/helpers/gradle.zsh"
[[ -s "$MY_CONF_HOME/helpers/k8s.zsh" ]] && source "$MY_CONF_HOME/helpers/k8s.zsh"

alias env-aws-work='source /home/wls/.aws_work.zsh'
alias env-aws-personal='source /home/wls/.aws_personal.zsh'

alias env-hcloud-work='source /home/wls/.hcloud_work.zsh'
alias env-hcloud-personal='source /home/wls/.hcloud_personal.zsh'

alias terminal-theme-dark='cat /home/wls/Projects/Personal/conf/gnome-terminal-dark.dconf | dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/'
alias terminal-theme-light='cat /home/wls/Projects/Personal/conf/gnome-terminal-light.dconf | dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/'

[[ -s "/home/wls/Scripts/words.py" ]] && python3 "/home/wls/Scripts/words.py"
