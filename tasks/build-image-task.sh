#!/bin/bash

echo 'check packer version'
packer -v

echo 'Change to template directory'
cd image-rhel7
ls -al

echo 'Validate packer template'
packer validate -var-file='../image-configuration/config.json' -var-file='../image-secret/secrets.json' template.json

echo 'Build packer template'
#packer build -var-file='../image-configuration/config.json' -var-file='../image-secret/secrets.json' template.json

echo 'Copy manifest.json to artifact repo'
cd ../image-artifact
git status

