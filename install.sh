#!/bin/bash


# if [ -f ~/mydotfiles/bash/.bashrc ]; then
#  . ~/mydotfiles/bash/.bashrc
# fi

# global variable
pkgm='pkg'


mkSpace() {
  echo ' '
}

setup_bash() {
  echo 'Configuring base profile...'
  mkSpace

  if [ -f ~/.bashrc ]; then
    echo 'Removing old .bashrc'
    rm ~/.bashrc
  fi

  echo 'Creating .bashrc'
  printf 'if [ -f ~/mydotfiles/bash/.bashrc ]; then\n . ~/mydotfiles/bash/.bashrc\nfi' >> ~/.bashrc

  echo 'done'
  mkSpace
}

install_and_setup_tmux() {
  echo 'Instlling tmux...'
  $pkgm install tmux
  mkSpace

  if [ -f ~/.tmux.conf ]; then
    echo 'Removing old .tmux.conf'
    rm ~/.tmux.conf
  fi

  echo 'Creating .tmux.conf'
  printf 'source-file ~/mydotfiles/tmux/.tmux.conf \nbind r source-file ~/.tmux.conf' >> ~/.tmux.conf

  echo 'done'
  mkSpace
}

install_and_setup_nvim() {
  echo 'Installing Neovim...'
  $pkgm install neovim
  mkSpace

  if [ -d ~/.config ]; then
    echo 'Removing old .config directory.'
    rm -rf ~/.config
  fi

  echo 'Creating .config/nivm/init.vim.'
  mkdir ~/.config/nivm -p
  mkdir ~/.config/nivm/tmp -p
  touch ~/.config/nivm/init.vim
  printf 'if !empty(glob("~/mydotfiles/nvim/init.vim"))\n  source ~/mydotfiles/nvim/mod.dorin.vim\n  echo "Welcom to Neovim" \nendif' >> ~/.config/nivm/init.vim

  echo 'Installing vim-plug.'
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo 'done'
  mkSpace
}


auto_install_everything() {
  echo ' ** Auto Install ** '

  setup_bash
  install_and_setup_tmux
  install_and_setup_nvim
}

prompt_and_get_answers() {
  echo '(1) Auto install.'
  echo '(2) Manual install.'
  echo '>> Select any option.'
  read isAutoInstall
  mkSpace

  echo ">> Type the pkg manager you're using.."
  read pkgName
  pkgm=$pkgName
  mkSpace

  if [ $isAutoInstall -eq 1 ]
  then auto_install_everything
  else manual_install
  fi
}

prompt_and_get_answers
