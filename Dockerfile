FROM frapsoft/zsh

# Installing utils
RUN apk add --update --no-cache git curl python3 py3-pip

# Change workdir to root's home
WORKDIR /root

# Coppying Spaceship to the image
COPY . /spaceship

# Setting up .zshrc
RUN echo "export TERM=xterm-256color" >> /root/.zshrc
RUN echo "source spaceship/spaceship.zsh" >> /root/.zshrc

# zsh as an entrypoint
ENTRYPOINT ["/bin/zsh"]
