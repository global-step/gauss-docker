#!/bin/bash -x

. $HOME/.bash_profile

/usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true &

cd ~/Gauss 
gem update --system
gem update bundler
bundle install --path vendor/bundle
bundle rake db:migrate

bundle rake jobs:work & 
bundle rails s

