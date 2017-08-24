#!/bin/sh
cd ~/char-rnn/
LATEST=$(ls cv | tail -1)
/root/torch/install/bin/th sample.lua cv/$LATEST -gpuid -1
