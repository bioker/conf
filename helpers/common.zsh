alias e='vim ~/.zshrc'
alias s='source ~/.zshrc'
alias jc='jupyter console'
alias epoch='date +%s%3N'
alias now='date --rfc-3339=ns'
alias jmx='java -jar /home/wls/Programs/jmxterm/jmxterm.jar'
alias tf='terraform'
alias passgen='cat /dev/urandom | head -c24 | md5sum | cut -d " " -f1 | tr -d $"\n"'
alias macgen='echo -n 02; od -t x1 -An -N 5 /dev/urandom | tr " " ":"'
alias getip="ip --brief addr show wlp82s0 | tr -s ' ' | cut -d ' ' -f3 | cut -d '/' -f1"

abbr -S -g --force --quiet xclp='xclip -selection c'

function agsed {
    ag -l $1 | xargs sed -i -e "s/$1/$2/g"
}
