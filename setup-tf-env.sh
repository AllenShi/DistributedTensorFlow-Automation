#!/bin/bash

virtualenv --system-site-packages -p python3 /home/deeplearning/virtualenv/python3
source /home/deeplearning/virtualenv/python3/bin/activate

easy_install -U pip
pip3 install --upgrade tensorflow

pip3 install pillow
pip3 install lxml
pip3 install jupyter
pip3 install matplotlib
