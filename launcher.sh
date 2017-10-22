#!/bin/bash

ansible-playbook setup-tf-env.yml

ansible-playbook deploy-tf-model.yml
