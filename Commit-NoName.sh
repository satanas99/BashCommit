#!/bin/bash

#Fait un commit en demandant le nom du commit, le nom de l'user et son email , et les logs github
echo "Donner le nom du commit"
read commit

echo "Donner le nom d'utilisateur"
read name

echo "Donner l'email de $name"
read email

git add .
echo "===> Creation des config ..."
git config --global user.name "$name"
git config --global user.email "$email"
echo "Fait"


echo -n "Enter github username: "
read username

echo -n "Enter a password: "
read -s password
echo

var=$(git remote -v | head -n 1)

strarr=$(sed 's/origin//' <<< $var)
strarr=$(sed 's/(fetch)//' <<< $strarr)
strarr=$(sed 's/https:\/\///' <<< $strarr)
strarr=${strarr//$'\t'/ } <<< $strarr
strarr=$(sed 's/ //g' <<< $strarr)

echo "===> Creation du commit et push sur github ..."
git commit -m "$commit"
git push https://$username:$password@$strarr --all
