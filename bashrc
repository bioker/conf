# prompt
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\]:\[\e[33m\]\w \[\e[m\]\\$ "

# color terminal
case "$TERM" in
    xterm*)
        export TERM=xterm-256color
        ;;
esac

# time style
export TIME_STYLE=long-iso

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tmux='tmux -u'
alias groovyd='groovy -Dgroovy.grape.report.downloads=true'
alias imgfile='xclip -selection clipboard -t image/png -o > temp.png'
alias txtfile='xclip -selection clipboard -t TEXT -o > temp.txt'

# developer environment
## JDK
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
#export PATH="$PATH:$JAVA_HOME/bin"
## Groovy
export GROOVY_HOME="$HOME/dev/groovy-2.4.10"
export PATH="$PATH:$GROOVY_HOME/bin"
## Maven
export MAVEN_HOME="$HOME/dev/apache-maven-3.5.0"
export PATH="$PATH:$MAVEN_HOME/bin"
## Gradle
export GRADLE_HOME="$HOME/dev/gradle-3.5"
export PATH="$PATH:$GRADLE_HOME/bin"
## Node JS
export PATH="$PATH:$HOME/dev/node-v6.10.3-linux-x64/bin"
## MongoDB
export PATH="$PATH:$HOME/dev/mongodb-linux-x86_64-debian81-3.4.4/bin"
## Exercism
export PATH="$PATH:$HOME/dev/exercism"
## IDEA
export PATH="$PATH:$HOME/dev/idea-IC-171.4424.56/bin"
## TomEE
#export CATALINA_HOME="$HOME/dev/apache-tomcat-8.5.16"
#export PATH="$PATH:$CATALINA_HOME/bin"
## Mule ESB
export MULE_HOME="$HOME/dev/mule-standalone-3.7.0"
export PATH="$PATH:$MULE_HOME/bin"
## WildFly
export JBOSS_HOME="$HOME/dev/wildfly-10.1.0.Final"
export PATH="$PATH:$JBOSS_HOME/bin"
## Scala
export SCALA_HOME="$HOME/dev/scala-2.12.4/"
export PATH="$PATH:$SCALA_HOME/bin/"
## Kotlin
export PATH="$PATH:$HOME/dev/kotlinc/bin/"
## KScript
export PATH="$PATH:$HOME/dev/kscript-2.3.0/bin/"
## SqlCl
export PATH="$PATH:$HOME/dev/sqlcl/bin"
## Java EE SDK
export PATH="$PATH:$HOME/dev/glassfish4/bin"
## Java EE SDK Glassfish
export PATH="$PATH:$HOME/dev/glassfish4/glassfish/bin"
## H2
export PATH="$PATH:$HOME/dev/h2/bin"
## Jmeter
export PATH="$PATH:$HOME/dev/apache-jmeter-3.2/bin/"
## Hadoop
export HADOOP_HOME="$HOME/dev/hadoop-2.9.0"
export HADOOP_MAPRED_HOME=$HADOOP_HOME 
export HADOOP_COMMON_HOME=$HADOOP_HOME 
export HADOOP_HDFS_HOME=$HADOOP_HOME 
export YARN_HOME=$HADOOP_HOME 
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native 
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin 
export HADOOP_INSTALL=$HADOOP_HOME
## Hive
export HIVE_HOME="$HOME/dev/apache-hive-2.3.3-bin"
export PATH=$PATH:$HIVE_HOME/bin
## Gron
export PATH="$PATH:$HOME/dev/gron"
## Hashcat
export PATH="$PATH:$HOME/dev/hashcat-4.1.0"
## BigDataProgramms
export BD="$HOME/dev/bigdata"
export PATH="$PATH:$BD/apache-hive-2.3.3-bin/"
export PATH="$PATH:$BD/kafka_2.12-1.1.0/bin"
export PATH="$PATH:$BD/spark-2.1.0-bin-hadoop2.7/bin"
export PATH="$PATH:$BD/zeppelin-0.7.3-bin-netinst/bin"
export PATH="$PATH:$BD/zookeeper-3.4.12/bin"

# screen setup
if [ -f ~/.myscreenrc ]; then
    . ~/.myscreenrc
fi

# scripts
if [ -f ~/.myscripts.sh ]; then
    . ~/.myscripts.sh
fi

# exercism cli completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
    . ~/.config/exercism/exercism_completion.bash
fi
