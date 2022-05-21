mkdir -p /home/wls/Projects/Personal
mkdir -p /home/wls/Scripts/my
mkdir -p /home/wls/Resources/my
mkdir -p /home/wls/Programs

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl -LO https://github.com/ktr0731/evans/releases/download/0.10.0/evans_linux_amd64.tar.gz
cat evans_linux_amd64.tar.gz | tar xz
sudo mv evans /usr/local/bin
rm -r evans_linux_amd64.tar.gz

curl -LO https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz
cat openjdk-15.0.2_linux-x64_bin.tar.gz | tar xz
sudo mkdir -p /usr/lib/jvm
sudo mv jdk-15.0.2 /usr/lib/jvm
rm -r openjdk-15.0.2_linux-x64_bin.tar.gz

curl -LO https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
cat go1.17.6.linux-amd64.tar.gz | tar xz
rm -f /home/wls/Programs/go /home/wls/Programs/go1.17.6
mv go /home/wls/Programs/go1.17.6
ln -s /home/wls/Programs/go1.17.6 /home/wls/Programs/go
rm go1.17.6.linux-amd64.tar.gz

curl -LO https://github.com/operator-framework/operator-sdk/releases/download/v1.15.0/operator-sdk_linux_amd64
curl -LO https://github.com/operator-framework/operator-sdk/releases/download/v1.15.0/helm-operator_linux_amd64
curl -LO https://github.com/operator-framework/operator-sdk/releases/download/v1.15.0/ansible-operator_linux_amd64

chmod 774 ansible-operator_linux_amd64 helm-operator_linux_amd64 operator-sdk_linux_amd64

sudo mv operator-sdk_linux_amd64 /usr/local/bin/operator-sdk
sudo mv ansible-operator_linux_amd64 /usr/local/bin/ansible-operator
sudo mv helm-operator_linux_amd64 /usr/local/bin/helm-operator

curl -LO https://github.com/JetBrains/kotlin/releases/download/v1.6.10/kotlin-compiler-1.6.10.zip
unzip kotlin-compiler-1.6.10.zip
mv kotlinc /home/wls/Programs/kotlinc1.6.10
ln -s /home/wls/Programs/kotlinc1.6.10 /home/wls/Programs/kotlinc
rm kotlin-compiler-1.6.10.zip

curl -LO https://github.com/rancher/rke/releases/download/v1.3.4/rke_linux-amd64
mv rke_linux-amd64 rke
chmod +x rke
sudo mv rke /usr/local/bin

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

wget https://dl.step.sm/gh-release/cli/docs-cli-install/v0.18.1/step-cli_0.18.1_amd64.deb
sudo dpkg -i step-cli_0.18.1_amd64.deb
rm step-cli_0.18.1_amd64.deb

curl https://installer.id.ee/media/install-scripts/install-open-eid.sh | bash
cat configure_git.sh | bash
cat configure_vim.sh | bash

# install ssh and gpg keys to proceed

git clone git@github.com:bioker/vimconf.git /home/wls/Projects/Personal/vimconf
git clone git@github.com:bioker/conf.git /home/wls/Projects/Personal/conf

ln -s /home/wls/Projects/Personal/vimconf /home/wls/.vim
ln -s /home/wls/Projects/Personal/conf/curlrc /home/wls/.curlrc
ln -s /home/wls/Projects/Personal/conf/tmux.conf /home/wls/.tmux.conf
ln -s /home/wls/Projects/Personal/conf/zshrc /home/wls/.zshrc
ln -s /home/wls/Projects/Personal/conf/tigrc /home/wls/.tigrc
ln -s /home/wls/Projects/Personal/conf/configure_ansible_completion.sh /home/wls/.configure_ansible_completion.sh

sudo mkdir -p /usr/local/share/applications
sudo ln -s /home/wls/Projects/Personal/conf/desktop-entries/freecad.desktop /usr/local/share/applications/freecad.desktop
sudo ln -s /home/wls/Projects/Personal/conf/desktop-entries/cura.desktop /usr/local/share/applications/cura.desktop

git clone https://github.com/tmux-plugins/tpm /home/wls/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/JamesKovacs/zsh_completions_mongodb.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/mongodb
git clone https://github.com/bioker/kafka-zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/kafka-zsh-completions
git clone https://github.com/olets/zsh-abbr.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-abbr
git clone https://github.com/macunha1/zsh-terraform ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/terraform

chsh -s $(which zsh)

curl https://raw.githubusercontent.com/bioker/conf/master/gnome-terminal-dark.dconf | dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/
curl https://raw.githubusercontent.com/bioker/conf/master/dash-to-dock.dconf | dconf load /org/gnome/shell/extensions/
curl https://raw.githubusercontent.com/bioker/conf/master/input-sources.dconf | dconf load /org/gnome/desktop/input-sources/
curl https://raw.githubusercontent.com/bioker/conf/master/desktop-icons.dconf | dconf load /org/gnome/shell/extensions/desktop-icons/
