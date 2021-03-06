# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Parts borrowed from:
# https://github.com/musitdev/portmidi-rs/blob/master/Vagrantfile and https://gist.github.com/dommmel/2cc0195b25c07358c15a
$script = <<SCRIPT
set -e
set -x

cd
sudo apt-get update -y
sudo apt-get install \
  git-core\
  curl\
  build-essential\
  libssl-dev\
  libreadline-dev\
  libxml2-dev\
  libxslt1-dev\
  libcurl4-openssl-dev\
  -y 2> /dev/null

# install rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Setup rbenv paths
pathstring='export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"'
eval $pathstring
echo $pathstring >> ~/.bashrc

# Init rbenv
initstring='eval "\$(rbenv init -)"'
echo $initstring >> ~/.bashrc
eval $initstring

# install ruby
CONFIGURE_OPTS=--enable-shared rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
# install gems
gem install bundler pry rspec
rbenv rehash

# install rust
sudo sh -c 'echo "curl -L https://static.rust-lang.org/rustup.sh | sudo sh" > /usr/bin/rustup.sh'
sudo chmod a+x /usr/bin/rustup.sh
sudo /usr/bin/rustup.sh
rPath='export PATH="$HOME/.cargo/bin:$PATH"'
echo $rPath >> .bashrc
source ~/.bashrc
source ~/.profile

cd /home/vagrant/fireflower
git checkout master
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
bundle install
git checkout step0
echo cd ~/fireflower >> ~/.bashrc
echo cd ~/fireflower >> ~/.profile

SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "./", "/home/vagrant/fireflower"
  config.vm.provision :shell, inline: $script, privileged: false
end
