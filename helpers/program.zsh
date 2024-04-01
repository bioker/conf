export GOPATH=/home/wls/.go
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME="$HOME/Android/Sdk"

export PATH=$PATH:$HOME/Programs/evans
export PATH=$PATH:$HOME/Programs/go/bin
export PATH=$PATH:$HOME/.go/bin
export PATH=$PATH:$HOME/Programs/kotlinc/bin
export PATH=$PATH:$HOME/Programs/kafka/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

abbr -S -g --force --quiet cenv='python3 -m venv venv'
abbr -S -g --force --quiet senv='source venv/bin/activate'
abbr -S -g --force --quiet denv='deactivate'
