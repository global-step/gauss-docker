#!/bin/bash

sudo /usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true &

cd /home/Gauss
bundle rake jobs:work & 
bundle rails s

