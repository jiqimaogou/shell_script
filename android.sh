export HTTP_PROXY=http://web-proxy.oa.com:8080
export HTTPS_PROXY=http://web-proxy.oa.com:8080
if [ -f "~/android.dmg" ]; then
    # echo 'PATH=$PATH:~/' >> ~/.bashrc
    # source ~/.bashrc
else
    # echo 'PATH=$PATH:~/' >> ~/.bash_profile
    # source ~/.bash_profile
    sudo hdiutil create -size 50g -type UDIF -fs HFSX -volname android ~/android.dmg 
    sudo chown $USER ~/android.dmg 
    # command to mount the android file image 
    function mountAndroid { hdiutil attach ~/android.dmg -mountpoint /Volumes/android; } 
    mountAndroid
fi
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
cd /Volumes/android 
mkdir android 
cd android 
repo init -u https://android.googlesource.com/platform/manifest
# repo sync
# 然后就是下载源码了，这里我强烈推荐下使用Android内核剖析(柯元旦著)一书提供的一段防止下载异常的脚本。因为单独下载可能会出现下载异常然后某个链接下载失败的情况。
repo sync   
while [ $? = 1 ]; do   
    echo "================sync failed, re-sync again ====="   
    sleep 3   
    repo sync   
done  
