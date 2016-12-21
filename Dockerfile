FROM chonla/alpine-php7:0.4
MAINTAINER Chonlasith Jucksriporn <chonla@capabilify.com>

# Download and extract BlueShirt package
RUN curl -O https://bitbucket.org/chonla/blueshirt/get/master.tar.gz \
    && mkdir -p /data/blueshirt && tar -C /data/blueshirt -vxf master.tar.gz

# Install BlueShirt
RUN cd /data/blueshirt && repo_dir=$(ls) && ln -s $repo_dir source && cd $repo_dir  \
    && php7 install.php

ENTRYPOINT ["php7", "-S", "0.0.0.0:8000", "-t", "/data/blueshirt/source"]
