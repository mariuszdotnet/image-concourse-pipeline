#!/bin/bash

echo 'check packer version'
packer -v

echo 'Change to template directory'
cd image-rhel7
ls -al

echo 'Validate packer template'
packer validate -var-file='../image-configuration/config.json' -var-file='../image-secret/secrets.json' template.json

echo 'Build packer template'
packer build -var-file='../image-configuration/config.json' -var-file='../image-secret/secrets.json' template.json

echo 'Copy manifest.json to artifact repo'
cd ../
git clone image-artifact image-artifact-output
cp image-rhel7/manifest.json image-artifact-output/manifest.json
cd image-artifact-output


git status

echo 'Commit new manifest file'
git config --global user.email "nobody@concourse-ci.org"
git config --global user.name "Concourse"
git add .
git commit -m "Commit packer manifest file"

echo 'Job completed!'