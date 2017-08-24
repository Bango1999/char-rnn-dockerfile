# char-rnn Dockerfile
| **Dockerfile &amp; script to build &amp; run char-rnn neural network**
## usage
+ build from Dockerfile
```sh
docker build -t myname/char-rnn /path/to/this/repo
```
+ run in detached mode
```sh
docker run -di --rm --name char-rnn myname/char-rnn
```
+ view training process output
```sh
docker exec -it char_rnn tail -f /rnn.log
```
+ sample from char-rnn checkpoint file
```sh
docker exec -it char-rnn bin/sh /sample.sh
```
+ access VM terminal
```sh
docker exec -it char-rnn bin/bash
```
+ kill the container
```sh
docker kill char-rnn
```
[Bango1999/char-rnn](https://github.com/Bango1999/char-rnn) forked from [karpathy/char-rnn](https://github.com/karpathy/char-rnn)
