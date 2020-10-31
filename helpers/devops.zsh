[[ -s "/home/wls/.configure_ansible_completion.sh" ]] && source "/home/wls/.configure_ansible_completion.sh"

abbr -S -g --force --quiet ap='ansible-playbook'
abbr -S -g --force --quiet ave='ansible-vault encrypt'
abbr -S -g --force --quiet avd='ansible-vault decrypt'

complete -o nospace -C /usr/bin/vault vault
complete -o nospace -C /usr/bin/terraform terraform

