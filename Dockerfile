FROM bravissimolabs/baseimage
MAINTAINER Adam K Dean <adamkdean@googlemail.com>

# Add Git and Node package sources
RUN add-apt-repository -y ppa:git-core/ppa; \
    curl -sL https://deb.nodesource.com/setup | sudo bash -

# Install packages
RUN apt-get install -yq \
    git \
    expect-dev \
    nodejs

# Update npm, then select specific version of Node.js via n
RUN npm install -g npm@^2 && \
    npm install -g n; \
    n 0.10 && npm install -g npm@^2; \
    node --version; npm --version 

ADD bin/ /usr/local/bin

CMD ["bash", "/usr/local/bin/npm.sh"]
