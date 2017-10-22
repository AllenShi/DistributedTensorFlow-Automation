#!/bin/bash

ansible-playbook setup-tf-env-test.yml

ansible-playbook deploy-tf-model-test.yml
