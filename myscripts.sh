process_nested_dirs() {
    for i in ./*;do
        if [ -d "$i" ];then
            echo "process dir: $i"
            cd $i
            $1
            cd ..
        elif [ -f "$i" ]; then
            echo "$i is a file"
        fi
    done
}

urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C
    
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
    
    LC_COLLATE=$old_lc_collate
}

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

alias git_r_status="process_nested_dirs 'git status'"
alias git_r_pull="process_nested_dirs 'git pull'"
