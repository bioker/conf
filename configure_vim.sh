cd /home/wls/Projects/Github
git clone https://github.com/vim/vim.git
cd vim
./configure \
  --with-features=huge \
  --with-x \
  --enable-luainterp=yes \
  --enable-mzschemeinterp \
  --enable-perlinterp=yes \
  --enable-pythoninterp=yes \
  --enable-python3interp=yes \
  --enable-tclinterp=yes \
  --enable-rubyinterp=yes \
  --enable-cscope \
  --enable-terminal \
  --enable-autoservername \
  --enable-multibyte \
  --enable-xim \
  --enable-fontset \
  --enable-gui=auto \
  --enable-gtk2-check=no \
  --enable-gnome-check=no \
  --enable-gtk3-check=yes \
  --enable-motif-check=no \
  --enable-gpm=yes
sudo make install
