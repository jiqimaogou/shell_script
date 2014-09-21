mkdir ~/bin
file="~/.bashrc"
if [ -f "$file" ]
then
    echo "$file found."
else
    echo "$file not found."
fi
if [ -f "~/.bashrc" ]; then
    echo 'PATH=~/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
else
    echo 'PATH=~/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile
fi
# PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
mkdir WORKING_DIRECTORY
cd WORKING_DIRECTORY
repo init -u https://android.googlesource.com/platform/manifest
repo sync

