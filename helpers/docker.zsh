alias d='sudo docker'
alias dps='sudo docker ps'
alias dip="sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias dex="sudo docker exec -it"
alias dl="sudo docker logs"
alias ds='sudo docker stop'
alias dsa='sudo docker stop $(sudo docker ps -qa)'
alias dpru='sudo docker container prune; sudo docker volume prune; sudo docker image prune'
