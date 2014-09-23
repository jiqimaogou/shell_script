export HTTP_PROXY=http://web-proxy.oa.com:8080
export HTTPS_PROXY=http://web-proxy.oa.com:8080
mkdir ~/bin
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
mkdir ub-tools-idea133
cd ub-tools-idea133
repo init -u https://android.googlesource.com/platform/manifest -b ub-tools-idea133
repo sync   
while [ $? = 1 ]; do   
    echo "================sync failed, re-sync again ====="   
    sleep 3   
    repo sync   
done  
cd tools
./gradlew prepareRepo
./gradlew clean assemble

