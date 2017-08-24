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
docker exec -t char_rnn tail -f /rnn.log
```
+ kill the container
```sh
docker kill char-rnn
```
+ sample from char-rnn checkpoint file
```sh
docker exec -t char_rnn cd ~/char-rnn && th sample.lua cv/some_checkpoint.t7 -gpuid -1
```

Bango1999/char-rnn forked from karpathy/char-rnn
