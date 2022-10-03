#[[ -s "/home/wls/.configure_ansible_completion.sh" ]] && source "/home/wls/.configure_ansible_completion.sh"

[[ ! -d "$HOME/.tfenv" ]] && git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

abbr -S -g --force --quiet ap='ansible-playbook'
abbr -S -g --force --quiet ave='ansible-vault encrypt'
abbr -S -g --force --quiet aves='ansible-vault encrypt_string --encrypt-vault-id default --vault-password-file $ANSIBLE_VAULT_PASS'
abbr -S -g --force --quiet avd='ansible-vault decrypt'
abbr -S -g --force --quiet agc='ansible-galaxy collection'

complete -o nospace -C /usr/bin/vault vault
complete -o nospace -C /home/wls/.tfenv/bin/terraform terraform
complete -o nospace -C /usr/bin/consul consul
complete -o nospace -C /usr/bin/nomad nomad
