#!/bin/bash

export DL_WORK_HOME=/home/deeplearning
export DL_WORK_SPACES=${DL_WORK_HOME}/projects
export DL_TF_MODEL_DIR=${DL_WORK_SPACES}/Google/tensorflow/models/research
export PYTHONPATH=$PYTHONPATH:${DL_TF_MODEL_DIR}:${DL_TF_MODEL_DIR}/slim

export TF_CONFIG="{\"cluster\": {\"master\": [\"oxr-dev1.fyre.io:2220\"], \"ps\": [\"oxr-dev2.fyre.io:2221\"], \"worker\": [\"oxr-dev2.fyre.io:2222\", \"oxr-dev3.fyre.io:2222\", \"oxr-dev4.fyre.io:2222\", \"oxr-dev5.fyre.io:2222\", \"oxr-dev6.fyre.io:2222\"]}}"

source ${DL_WORK_HOME}/virtualenv/python3/bin/activate

cd  ${DL_WORK_SPACES}/Cognitive-OXR/tensorflow
mkdir -p evaluate

python ${DL_TF_MODEL_DIR}/object_detection/eval.py --logtostderr --master=oxr-dev --pipeline_config_path=./faster_rcnn_resnet101_marmot.config --eval_dir=evaluate --checkpoint_dir=train
