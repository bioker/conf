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
abbr -S -g --force --quiet psfid="ps aux | fzf | tr -s ' ' | cut -d ' ' -f 2"

function agsed {
    ag -l $1 | xargs sed -i -e "s/$1/$2/g"
}

function hex_to_rgb {
    hexinput=`echo $1 | tr '[:lower:]' '[:upper:]'`  # uppercase-ing
    a=`echo $hexinput | cut -c-2`
    b=`echo $hexinput | cut -c3-4`
    c=`echo $hexinput | cut -c5-6`

    r=`echo "ibase=16; $a" | bc`
    g=`echo "ibase=16; $b" | bc`
    b=`echo "ibase=16; $c" | bc`

    echo "rgb($r, $g, $b)"
}
