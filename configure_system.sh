mkdir -p /home/wls/Projects/my
mkdir -p /home/wls/Scripts/my
mkdir -p /home/wls/Resources/my
mkdir -p /home/wls/Programs

sudo apt install -y git zsh gnome-tweaks cryptsetup curl ffmpeg fzf chromium-browser clickhouse-client cpulimit dconf-editor freeglut3-dev git-flow gnupg2 graphviz htop jq kafkacat libncurses5-dev libncursesw5-dev libsdl1.2-dev libsdl-image1.2 libsdl-ttf2.0-0 lm-sensors mongodb-clients moreutils mysql-client net-tools nmap nodejs opensc p7zip python python-dev python3-dev python3-pip python-pygments redis-tools silversearcher-ag steam-installer terminator tidy tig tmux traceroute virtualbox virtualbox-ext-pack vlc weechat xclip apt-transport-https ca-certificates gnupg-agent software-properties-common openjdk-14-jdk mesa-common-dev fonts-powerline pv dstat iftop protobuf-compiler translate-shell

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt install -y docker-ce docker-ce-cli containerd.io

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt install google-cloud-sdk

wget https://go.skype.com/skypeforlinux-64.deb
sudo apt install -y ./skypeforlinux-64.deb
rm ./skypeforlinux-64.deb

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.3-amd64.deb
sudo apt install -y ./slack-desktop-*.deb
rm ./slack-desktop-*.deb

wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb
rm ./teamviewer_amd64.deb

wget https://github.com/dandavison/delta/releases/download/0.1.1/git-delta_0.1.1_amd64.deb
sudo apt install -y ./git-delta_0.1.1_amd64.deb
rm ./git-delta_0.1.1_amd64.deb

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -LO https://github.com/int128/kubelogin/releases/download/v1.19.1/kubelogin_linux_amd64.zip
unzip kubelogin_linux_amd64.zip
sudo mv kubelogin /usr/local/bin/kubectl-oidc_login
rm kubelogin_linux_amd64.zip
rm LICENSE

curl -LO https://github.com/psycofdj/yaml-path/releases/download/v0.4/yaml-path-0.4.linux-amd64.tar.gz
cat yaml-path-0.4.linux-amd64.tar.gz | tar xz
sudo mv yaml-path-0.4.linux-amd64/yaml-path /usr/local/bin
rm -r yaml-path-0.4.linux-amd64
rm -r yaml-path-0.4.linux-amd64.tar.gz

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

mkdir -p /home/wls/Programs/jmxterm
curl -L https://github.com/jiaqi/jmxterm/releases/download/v1.0.1/jmxterm-1.0.1-uber.jar -o /home/wls/Programs/jmxterm/jmxterm-1.0.1-uber.jar
ln -s /home/wls/Programs/jmxterm/jmxterm-1.0.1-uber.jar /home/wls/Programs/jmxterm/jmxterm.jar

curl -LO https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip
unzip vault_1.4.2_linux_amd64.zip
sudo mv vault /usr/local/bin
rm vault_1.4.2_linux_amd64.zip
vault -autocomplete-install

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
curl https://installer.id.ee/media/install-scripts/install-open-eid.sh | bash
curl https://raw.githubusercontent.com/bioker/conf/master/configure_git.sh | bash
curl https://raw.githubusercontent.com/bioker/conf/master/configure_vim.sh | bash

# install ssh and gpg keys to proceed

git clone git@github.com:bioker/vimconf.git /home/wls/Projects/my/vimconf
git clone git@github.com:bioker/conf.git /home/wls/Projects/my/conf

ln -s /home/wls/Projects/my/vimconf /home/wls/.vim
ln -s /home/wls/Projects/my/conf/curlrc /home/wls/.curlrc
ln -s /home/wls/Projects/my/conf/tmux.conf /home/wls/.tmux.conf
ln -s /home/wls/Projects/my/conf/zshrc /home/wls/.zshrc

git clone https://github.com/tmux-plugins/tpm /home/wls/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/home/wls/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/wls/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-/home/wls/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/JamesKovacs/zsh_completions_mongodb.git ${ZSH_CUSTOM:-/home/wls/.oh-my-zsh/custom}/plugins/mongodb
git clone https://github.com/bioker/kafka-zsh-completions.git ${ZSH_CUSTOM:-/home/wls/.oh-my-zsh/custom}/plugins/kafka-zsh-completions

chsh -s $(which zsh)

curl https://raw.githubusercontent.com/bioker/conf/master/gnome-terminal-dark.dconf | dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/
curl https://raw.githubusercontent.com/bioker/conf/master/dash-to-dock.dconf | dconf load /org/gnome/shell/extensions/
curl https://raw.githubusercontent.com/bioker/conf/master/input-sources.dconf | dconf load /org/gnome/desktop/input-sources/
curl https://raw.githubusercontent.com/bioker/conf/master/desktop-icons.dconf | dconf load /org/gnome/shell/extensions/desktop-icons/
