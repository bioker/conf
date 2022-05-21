alias gipl='git pull'
alias gpcb='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gccb='git rev-parse --abbrev-ref HEAD | xclip -selection c'
alias gic='git checkout --'
alias gis='git status'
alias gidh='git diff HEAD'
alias gicb="git branch -a | fzf | tr -d '[:space:]' | tr -d '*' | xargs git checkout"
alias gicrb="git branch -a | fzf | tr -d '[:space:]' | rev | cut -d '/' -f1 | rev | xargs git checkout"

abbr -S -g --force --quiet gibclean="git branch --merged | grep -v 'develop\|main' | xargs git branch -d"
