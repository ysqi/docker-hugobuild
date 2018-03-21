FROM node

RUN buildDeps='pip install Pygments' \
    && npm install -g grunt-cli \
    && wget -O ./hugo.deb "https://github.com/gohugoio/hugo/releases/download/v0.37.1/hugo_0.37.1_Linux-64bit.deb" \   
    && dpkg -i hugo.deb \
    && hugo version  \
    && rm ./hugo.deb

# npm update check failed           
#  Try running with sudo or get access    
#  to the local update config store via     
RUN mkdir -p /.config
RUN chown -R node:$(id -gn node) /.config

# select user
USER node
