alias gb='./gradlew clean build --parallel'
alias gbxt='./gradlew clean build -x test --parallel'
alias gbim='./gradlew buildImage --parallel'
alias gbi='./gradlew dockerBuildImage'
alias gt='./gradlew test --parallel'
alias gr='./gradlew release -Prelease.useAutomaticVersion=true'
alias gtasks='./gradlew tasks --all -q > ./.gradle/.gradle_tasks' # caches current tasks of the project
abbr -S -g --force --quiet gtask='`cat ./.gradle/.gradle_tasks | fzf | cut -d " " -f1`' # runs the task that you choose in fzf
