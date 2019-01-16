#!/bin/bash -x

. $HOME/.bash_profile

/usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true & 
cd ~/Gauss 
gem uninstall did_you_mean
bundle install --path vendor/bundle
yarn install
bundle exec rake db:migrate
bundle exec rake jobs:work &
#bundle exec bin/webpack-dev-server &

bundle exec rails s 

