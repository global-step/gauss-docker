#!/bin/bash

/usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true &

cd ~/Gauss 
bundle rake jobs:work & 
bundle rails s

