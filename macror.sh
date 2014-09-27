# Installing Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# We're going to use rbenv to install and manage our Ruby versions.
brew install rbenv ruby-build


# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby 2.1.3 and set it as the default version
rbenv install 2.1.3
rbenv global 2.1.3
ruby -v
# ruby 2.1.3



# Installing Rails is as simple as running the following command in your Terminal:
gem install rails
# Rails is now installed, but in order for us to use the rails executable, we need to tell rbenv to see it:
rbenv rehash
rails -v
# Rails 4.1.6


# Setting Up A Database
# PostgreSQL
# You can install PostgreSQL server and client from Homebrew:
brew install postgresql
# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents
# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
