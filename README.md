### Prerequisite

* Install [Docker](https://docs.docker.com/install/)
* Install [docker-sync](https://github.com/EugenMayer/docker-sync/wiki)

### Run project 


```
$ cd <your dev dir>
$ git@github.com:global-step/Gauss.git

$ git clone git@github.com:global-step/gauss-docker.git
$ cd gauss-docker
$ docker-sync start
$ docker-compose up


## then only first time, you need to create db entry from seed
$ docker exec -it <container> /bin/bash
# cd ~/Gauss
# . $HOME/.bash_profile
# bundle exec rake db:seed 

```

### Troubleshooting

If some syncing issue happen, delete container and run `docker-sync clean` and start over.
