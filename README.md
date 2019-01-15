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
$ bundle exec rake db:migrate # only first time
$ bundle exec rake db:seed # only first time

$ docker run -d -v <your path to Gauss>:/root/Gauss -p 3000:3000
```
