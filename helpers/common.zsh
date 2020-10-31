alias e='vim ~/.zshrc'
alias s='source ~/.zshrc'
alias jc='jupyter console'
abbr -S -g --force --quiet xclp='xclip -selection c'
alias epoch='date +%s%3N'
alias now='date --rfc-3339=ns'
alias jmx='java -jar /home/wls/Programs/jmxterm/jmxterm.jar'
alias tf='terraform'
alias passgen='cat /dev/urandom | head -c24 | md5sum | cut -d " " -f1 | tr -d $"\n"'

function agsed {
    ag -l $1 | xargs sed -i -e "s/$1/$2/g"
}
