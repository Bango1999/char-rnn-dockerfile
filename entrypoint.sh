#!/bin/sh

: ${TRAINFILE:=train.lua}
: ${DATADIR:=data/tinyshakespeare}
: ${RNNSIZE:=512}
: ${NUMLAYERS:=2}
: ${DROPOUT:=0.5}
: ${GPUID:=-1}
: ${LOGF:=/root/char-rnn/rnn.log}


__execute_nn() {
	echo $TRAINFILE $DATADIR $RNNSIZE $NUMLAYERS $DROPOUT $GPUID
	echo "   >>> NN TRAINING <<<"
	export PATH=$PATH:"/root/torch/install/bin"
	cd ~/char-rnn
	th $TRAINFILE \
	-data_dir $DATADIR \
	-rnn_size $RNNSIZE \
	-num_layers $NUMLAYERS \
	-dropout $DROPOUT \
	-gpuid $GPUID \
	> $LOGF
	echo "   >>> DONE, EXITING <<<"
}

#Call all functions
__execute_nn

exec "$@"
