git clone git://github.com/huyng/bashmarks.git
cd bashmarks
make install
if [ -f "~/.bashrc" ]; then
    echo 'source ~/.local/bin/bashmarks.sh' >> ~/.bashrc
    source ~/.bashrc
else
    echo 'source ~/.local/bin/bashmarks.sh' >> ~/.bash_profile
    source ~/.bash_profile
fi
# source ~/.local/bin/bashmarks.sh from within your ~.bash_profile or ~/.bashrc file
