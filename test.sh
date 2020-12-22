#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
#venv=./.v
#pip3 install -q --user watchdog 
HOSTS="$1"
shift
ARGS="$@"
VERBOSE_MODE=""

if [[ "$HOSTS" == "" ]]; then 
  echo First Argument must be host list
  exit 1
fi

export ANSIBLE_KEEP_REMOTE_FILES=1
export ANSIBLE_STDOUT_CALLBACK=yaml
export ANSIBLE_CALLBACK_PLUGINS=./stdout_callbacks
export ANSIBLE_DISPLAY_ARGS_TO_STDOUT=False
export REGISTRY=registry.vpntech.net
export REGISTRY_USER=registryuser
export REGISTRY_PASS=registryuserpassword
export ANSIBLE_LIBRARY="$(pwd)/plugins/modules"
export ANSIBLE_MODULE_UTILS="$(pwd)/plugins/module_utils"
export ANSIBLE_CONNECTION_PLUGINS="$(pwd)/plugins/connection"


export DELETE_ALL_PODS_AND_CONTAINERS=yes

ansible-playbook \
    $VERBOSE_MODE \
    -i $HOSTS, \
    test_playbook.yaml $ARGS

