### Prerequisite

* Install [Docker](https://docs.docker.com/install/)
* Install [docker-sync](https://github.com/EugenMayer/docker-sync/wiki) with rsync

### Run project 


```
$ cd <your dev dir>
$ git@github.com:global-step/Gauss.git
$ cd ..
$ git clone git@github.com:global-step/gauss-docker.git

# Make sure your dev dir has both Gauss and gauss-docker

$ cd gauss-docker

# start containers
$ docker-sync-stack start

# or 

$ docker-sync start 
$ docker-compose up

# rails console
docker exec -it gauss-docker_web_1  bash -c '(source /root/.bash_profile && cd /root/Gauss/ && bundle exec rails c)'

## then only first time, you need to create db entry from seed
$ docker exec -it <container> /bin/bash
# cd ~/Gauss
# . $HOME/.bash_profile
# bundle exec rake db:seed 
```

