#!/bin/bash

echo 'check packer version'
packer -v

echo 'Change to template directory'
cd image-rhel7
ls -al

echo 'Validate packer template'
packer -var-file='../image-configuration/config.json' -var-file='../image-secret/secret.json' validate template.json
