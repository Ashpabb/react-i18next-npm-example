#!/bin/zsh

node -v
npm -v

mkdir ~/react-i18next-npm-example
cd ~/react-i18next-npm-example

npm init -y
cat package.json

npm i Ashpabb/react-i18next
cat package.json

ls node_modules/react-i18next/dist
