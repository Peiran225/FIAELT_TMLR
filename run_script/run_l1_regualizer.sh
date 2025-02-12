#!/usr/bin/env bash

EXP_ID_BASE='l1_reg'
LEARNING_RATE=0.012
NUM_ROUND=200
BATCH_SIZE=5
NUM_EPOCH=20
CLIENT_PER_ROUND=-1
MODEL='ann'

TERM_ALPHA=0

cd ../

CUDA_VISIBLE_DEVICES=0

for DATASET in 'FEMNIST'
do
    EXP_ID=$EXP_ID_BASE$LEARNING_RATE
    
    python main.py --dataset=$DATASET --optimizer='fiaelt' --exp_id=$EXP_ID  \
                --learning_rate=$LEARNING_RATE --num_rounds=$NUM_ROUND \
                --clients_per_round=$CLIENT_PER_ROUND --eval_every=1 \
                --batch_size=$BATCH_SIZE --num_epochs=$NUM_EPOCH --model=$MODEL --local_optim='svrg' \
                --term_alpha=0.1
done