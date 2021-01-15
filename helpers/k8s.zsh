abbr -S -g --force --quiet k='kubectl'
abbr -S -g --force --quiet kdev='kubectl -n develop'
abbr -S -g --force --quiet ktest='kubectl -n test'
abbr -S -g --force --quiet kspo='kubectl -n sport'
abbr -S -g --force --quiet kdis='kubectl -n discovery'
abbr -S -g --force --quiet kair='kubectl -n airflow'
abbr -S -g --force --quiet kaut='kubectl -n autotests'
abbr -S -g --force --quiet kmon='kubectl -n monitoring'
abbr -S -g --force --quiet kpay='kubectl -n payment'
abbr -S -g --force --quiet kst='kubectl -n staging'
abbr -S -g --force --quiet kist='kubectl -n istio-system'
abbr -S -g --force --quiet ksc='kubectl config use-context'
abbr -S -g --force --quiet kgc='kubectl config get-contexts'
abbr -S -g --force --quiet ksn="kubectl config set-context --current --namespace \"\$(kubectl get ns | fzf | cut -d ' ' -f1 | xargs)\""
abbr -S -g --force --quiet getkubimgs='yq r - "spec.template.spec.containers[*].image"'
abbr -S -g --force --quiet getkubimg='yq r - "spec.containers[*].image"'

function kglp {
    app_label=$1
    kubectl get pods -l app=$app_label --sort-by .metadata.creationTimestamp | tail -1 | cut -d ' ' -f1
}

function kelp {
    app_label=$1
    exec_command=$2
    latest_pod=`kglp $app_label`
    bash -c "kubectl exec -it $latest_pod -- $exec_command"
}
