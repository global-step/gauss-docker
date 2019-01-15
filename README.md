### Create image

```
$ cd <your dev dir>
$ git clone git@github.com:global-step/gauss-docker.git
$ docker build -t gauss .
```


### Run project 

```
$ cd <your dev dir>
$ git@github.com:global-step/Gauss.git
$ cd Gauss
$ cat .ruby-version
# install the ruby with rbenv or rvm
$ gem install bundler
$ bundle install --path vendor/bundle
$ bundle exec rake db:migrate 

$ docker run -d -v <your path to Gauss>:/root/Gauss -p 3000:3000


## then only first time, you need to create db entry from seed
$ docker exec -it <container> /bin/bash
# cd ~/Gauss
# . $HOME/.bash_profile
# bundle exec rake db:seed 
```
