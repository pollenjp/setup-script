# ruby_on_rails.sh
# Setup Ruby On Rails on
# Ubuntu 16.04 Xenial Xerus
# https://gorails.com/setup/ubuntu/16.04


# Prerequisite
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update -y
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn
sudo apt-get install -y libssl-dev libreadline-dev


# Install rbenv
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    # .bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    # .zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    # .bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    # .zshrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
exec $SHELL

rbenv install 2.5.1
rbenv global 2.5.1
ruby -v

gem install bundler

# rbenv users need to run `rbenv rehash` after installing bundler.



# install Rails
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

gem install rails -v 5.2.0

    # If you're using rbenv, you'll need to run the following command to make the rails executable available:
rbenv rehash

rails -v
# Rails 5.2.0





