# char-rnn neural network builder
FROM ubuntu:14.04
MAINTAINER "logan@swango.xyz"
LABEL version="1.0"
LABEL description="char-rnn neural network"
  LABEL RUN="docker run -di --rm --name char-rnn bango/char-rnn"
  LABEL SEE="docker exec -t char_rnn tail -f /rnn.log"
  LABEL KILL="docker kill char-rnn"
  LABEL SAMPLE="docker exec -t char_rnn cd ~/char-rnn && th sample.lua cv/some_checkpoint.t7 -gpuid -1"

# make bash, not sh**
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update/upgrade & install deps from apt-repositories
RUN apt-get update && apt-get install -y software-properties-common && apt-get install -y cmake && apt-get install -y curl && apt-get install -y wget && apt-get install -y git

# install torch
RUN curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | sed 's/sudo//g' | bash && git clone https://github.com/torch/distro.git ~/torch --recursive && cd ~/torch && ./install.sh

# install torch packages (char-rnn deps)
RUN ~/torch/install/bin/luarocks install nngraph && ~/torch/install/bin/luarocks install optim && ~/torch/install/bin/luarocks install nn

# clone char-rnn repo
RUN git clone https://github.com/Bango1999/char-rnn.git ~/char-rnn

# run on container create
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["train.lua", "data/tinyshakespeare", "512", "2", "0.5", "-1", "/rnn.log"]
