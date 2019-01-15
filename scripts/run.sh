#!/bin/bash -x

. $HOME/.bash_profile

/usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true &


cd ~/Gauss 
gem update --system
gem update bundler
gem uninstall -i /usr/local/lib/ruby/gems/1.2.0 did_you_mean # if needed
bundle install --path vendor/bundle
bundle exec rake db:migrate
bundle exec rake jobs:work & 
bundle exec rails s


