mkdir -p ~/Projects
mkdir -p ~/Scripts
mkdir -p ~/Resources
mkdir -p ~/Programs

packages="
asciinema
build-essential
clickhouse-client
curl
ffmpeg
flameshot
fonts-indic
fonts-powerline
fzf
git
gnome-tweaks
gparted
graphviz
htop
iftop
jq
kafkacat
lm-sensors
mysql-client
ncat
net-tools
nmap
openjdk-17-jdk
petname
postgresql-client
protobuf-compiler
pv
redis-tools
rkhunter
silversearcher-ag
tig
tmux
traceroute
vlc
weechat
wireguard
wireshark
x11vnc
xclip
zsh
"
sudo apt install $(echo $packages)

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin

curl -LO https://github.com/int128/kubelogin/releases/download/v1.28.1/kubelogin_linux_amd64.zip
unzip kubelogin_linux_amd64.zip
rm kubelogin_linux_amd64.zip LICENSE README.md
sudo mv kubelogin /usr/local/bin/kubectl-oidc_login

curl -L https://get.helm.sh/helm-v3.15.1-linux-amd64.tar.gz | tar xz
chmod +x linux-amd64/helm
sudo mv linux-amd64/helm /usr/local/bin
rm -r linux-amd64

curl -L https://github.com/fluxcd/flux2/releases/download/v2.3.0/flux_2.3.0_linux_amd64.tar.gz | tar xz
sudo mv flux /usr/local/bin

curl -L https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
unzip awscliv2.zip
sudo ./aws/install
rm -r aws awscliv2.zip

curl -L https://github.com/hetznercloud/cli/releases/download/v1.43.1/hcloud-linux-amd64.tar.gz | tar xz
rm LICENSE README.md
sudo mv hcloud /usr/local/bin

curl -LO https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb
sudo apt install ./git-delta_0.17.0_amd64.deb
rm git-delta_0.17.0_amd64.deb

curl -LO https://github.com/mikefarah/yq/releases/download/v4.44.1/yq_linux_amd64
chmod +x yq_linux_amd64
sudo mv yq_linux_amd64 /usr/local/bin/yq

echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
wget -O- https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-cli

sudo curl -sL https://github.com/projectcalico/calico/releases/download/v3.24.1/calicoctl-linux-amd64 -o /usr/local/bin/calicoctl && sudo chmod +x /usr/local/bin/calicoctl

curl -LO https://github.com/cli/cli/releases/download/v2.50.0/gh_2.50.0_linux_amd64.deb
sudo apt install ./gh_2.50.0_linux_amd64.deb
rm ./gh_2.50.0_linux_amd64.deb

wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.26.3/kubeseal-0.26.3-linux-amd64.tar.gz
tar -xvzf kubeseal-0.26.3-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
rm kubeseal-0.26.3-linux-amd64.tar.gz kubeseal

curl -sL https://github.com/itaysk/kubectl-neat/releases/download/v2.0.3/kubectl-neat_linux_amd64.tar.gz | tar xz
sudo mv kubectl-neat /usr/local/bin
rm LICENSE

wget https://dl.step.sm/gh-release/cli/gh-release-header/v0.22.0/step-cli_0.22.0_amd64.deb
sudo apt install ./step-cli_0.22.0_amd64.deb
rm step-cli_0.22.0_amd64.deb

curl -sLO https://github.com/linkerd/linkerd2/releases/download/stable-2.12.1/linkerd2-cli-stable-2.12.1-linux-amd64
chmod +x linkerd2-cli-stable-2.12.1-linux-amd64
sudo mv linkerd2-cli-stable-2.12.1-linux-amd64 /usr/local/bin/linkerd

curl -sL https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz | tar xz
rm LICENSE README.md
sudo mv k9s /usr/local/bin

curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
      sudo gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 700 msfinstall && ./msfinstall

wget https://downloads.mongodb.com/compass/mongodb-compass_1.43.0_amd64.deb
sudo apt install -f ./mongodb-compass_1.43.0_amd64.deb
rm ./mongodb-compass_1.43.0_amd64.deb

wget https://downloads.mongodb.com/compass/mongodb-mongosh_2.2.6_amd64.deb
sudo apt install -f ./mongodb-mongosh_2.2.6_amd64.deb
rm ./mongodb-mongosh_2.2.6_amd64.deb

curl -sL https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-x86_64-100.9.4.tgz | tar xz
sudo mv mongodb-database-tools-ubuntu2204-x86_64-100.9.4/bin/* /usr/local/bin
rm -r mongodb-database-tools-ubuntu2204-x86_64-100.9.4

wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb
sudo dpkg -i trivy_0.18.3_Linux-64bit.deb
rm trivy_0.18.3_Linux-64bit.deb

echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: $(lsb_release -cs)
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
sudo apt-get update
sudo apt-get install azure-cli

git config --global user.name 'Viktor Vlasov'
git config --global user.email 'viktorvlasovsiberian@gmail.com'

git config --global core.autocrlf input
git config --global core.quotepath false
git config --global diff.tool 'vimdiff'
git config --global merge.tool 'vimdiff'
git config --global core.pager 'delta --keep-plus-minus-markers --plus-style "#00FF00" --minus-style "#FF0000"'
git config --global interactive.diffFilter 'delta --color-only'

git config --global push.default simple
git config --global user.signingkey C1A1019C
git config --global commit.gpgsign true

echo "-w \"\\n\"" > ~/.curlrc
echo "set commit-order = date" > ~/.tigrc

cat <<EOT > ~/.tmux.conf
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'bioker/yatsl'

set -g default-terminal "screen-256color"
set -g status-right-length 200
set -g status-interval 1
set -g history-limit 50000
set -g status-right '#{prefix_highlight}|#{colored_cpu}|#{colored_memory}|#{colored_battery}|#{colored_online}| %H:%M:%S '

set-window-option -g mode-keys vi

bind v copy-mode
bind R source-file '~/.tmux.conf'
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

run -b '~/.tmux/plugins/tpm/tpm'
EOT

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/JamesKovacs/zsh_completions_mongodb.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/mongodb
git clone https://github.com/bioker/kafka-zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/kafka-zsh-completions
git clone https://github.com/olets/zsh-abbr.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-abbr
git clone https://github.com/macunha1/zsh-terraform ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/terraform

# install ssh and gpg keys to proceed

git clone git@github.com:bioker/vimconf.git ~/Projects/Personal/vimconf
git clone git@github.com:bioker/conf.git ~/Projects/Personal/conf

ln -s ~/Projects/Personal/vimconf ~/.vim
ln -s ~/Projects/Personal/vimconf/vimrc ~/.vimrc
ln -s ~/Projects/Personal/conf/zshrc ~/.zshrc
ln -s ~/Projects/Personal/conf/configure_ansible_completion.sh ~/.configure_ansible_completion.sh

chsh -s $(which zsh)

curl https://raw.githubusercontent.com/bioker/conf/master/gnome-terminal-dark.dconf | dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/
curl https://raw.githubusercontent.com/bioker/conf/master/dash-to-dock.dconf | dconf load /org/gnome/shell/extensions/
curl https://raw.githubusercontent.com/bioker/conf/master/input-sources.dconf | dconf load /org/gnome/desktop/input-sources/
curl https://raw.githubusercontent.com/bioker/conf/master/desktop-icons.dconf | dconf load /org/gnome/shell/extensions/desktop-icons/
