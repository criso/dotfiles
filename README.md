Installation:

    git://github.com/criso/dotfiles.git

Create symlinks:

    ln -s ~/dotfiles/.vim  ~/.vim
    ln -s ~/dotfiles/.vim/vimrc ~/.vimrc
    ln -s ~/dotifles/.vim/gvimrc ~/.gvimrc

Switch to the `~/dotifles` directory, and fetch submodules:

    cd ~/dotfiles
    git submodule init
    git submodule update

For javascript IDE-like HAWTNESS

- install exuberant-ctags
- Clone DoctorJS from github: git clone https://github.com/mozilla/doctorjs.git
- #Go inside DoctorJS dir and make install 

To update the submodules
	git submodule foreach git pull origin master
