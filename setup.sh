#!/bin/bash
set -ex
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p ~/.ansible/collections/ansible_collections/containers
ln -s $(pwd) ~/.ansible/collections/ansible_collections/containers/podman


