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
alias git_r_status="process_nested_dirs 'git status'"
alias git_r_pull="process_nested_dirs 'git pull'"
