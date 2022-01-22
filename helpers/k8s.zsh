abbr -S -g --force --quiet k='kubectl'
abbr -S -g --force --quiet ksc='kubectl config use-context'
abbr -S -g --force --quiet kgc='kubectl config get-contexts'
abbr -S -g --force --quiet ksn="kubectl config set-context --current --namespace \"\$(kubectl get ns | fzf | cut -d ' ' -f1 | xargs)\""
