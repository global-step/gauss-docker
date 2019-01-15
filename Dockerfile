# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# ------------------------------------------------------------------------------
# Pull base image.
FROM ubuntu:18.04
MAINTAINER Shohei Kameda<shoheik@cpan.org>

ENV RUBY_VERSION 2.5.3

RUN apt-get update
RUN apt-get install -y curl wget git

# ------------------------------------------------------------------------------
# ruby 
# ------------------------------------------------------------------------------

# rbenv depend and install
RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev 
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo 'export RBENV_ROOT="/usr/local/rbenv"' >> $HOME/.bashrc
RUN echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> $HOME/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# ruby
RUN . $HOME/.bashrc && CONFIGURE_OPTS="--disable-install-rdoc" rbenv install -v $RUBY_VERSION
RUN . $HOME/.bashrc && rbenv rehash
RUN . $HOME/.bashrc && rbenv global $RUBY_VERSION
RUN . $HOME/.bashrc && gem install bundler

#------------------------------------------------------------------------------
# depending packages   
#------------------------------------------------------------------------------
# elasticsearch
RUN cd /tmp && curl -LO https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.4.1/elasticsearch-2.4.1.deb && dpkg -i elasticsearch-2.4.1.deb &&  rm elasticsearch-2.4.1.deb && ln -s /etc/elasticsearch/ /usr/share/elasticsearch/config

# java
RUN apt-get install openjdk-8-jdk -y
# sudo /usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true

# heroku cli
RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
# Redis
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y build-essential tcl
RUN cd /tmp && curl -O http://download.redis.io/redis-stable.tar.gz && tar xzvf redis-stable.tar.gz && cd redis-stable && make && make install

# Sqlite
RUN apt-get install -y sqlite3 libsqlite3-dev
# Postgres
RUN apt-get install -y postgresql postgresql-contrib libpq-dev
# Imagemagick
RUN apt-get install -y imagemagick
RUN apt-get install -y libmagickcore-dev libmagickwand-dev
# libcurl
RUN apt-get install -y libcurl3 libcurl3-gnutls # libcurl4-openssl-dev
# Japanese font
RUN  apt-get -y install language-pack-ja
RUN  apt-get -y install libpq-dev
# https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p


#-------------------------------------------------------------------------------
# Clean up APT when done.
#-------------------------------------------------------------------------------
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
ADD scripts/run.sh /
CMD ["/run.sh"]




