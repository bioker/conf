alias gajava='git add \*.java'
alias gasql='git add \*.sql'
alias gaproto='git add \*.proto'
alias gaprops='git add \*.properties'
alias gpcb='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gccb='git rev-parse --abbrev-ref HEAD | xclip -selection c'
alias gdev='git checkout develop'
alias gicc='git checkout -- .'
alias gic='git checkout --'
alias gis='git status'
alias gipl='git pull'
alias giph='git push'
alias gidh='git diff HEAD'
alias gicb="git branch -a | fzf | tr -d '[:space:]' | tr -d '*' | xargs git checkout"
alias gicdf="echo \"clean all non-versioned files?\" && [[ 'yes' == \"\$(read temp; echo \$temp)\" ]] && git clean -df"
alias gidco="git log --left-right --cherry-pick --oneline"

function git_diff_commits {
    ref_left=$1
    ref_right=$2
    pattern=$3
    git log --left-right --cherry-pick --oneline $ref_left...$ref_right | grep "$pattern" | sort | uniq
}

function git_diff_commits_get_pattern {
    ref_left=$1
    ref_right=$2
    pattern=$3
    git log --left-right --cherry-pick --oneline $ref_left...$ref_right | grep -Po "$pattern" | sort | uniq
}
