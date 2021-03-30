#!/bin/bash

#Fait un commit en demandant le nom du commit
echo "Donner le nom du commit"
read commit

name='' #Nom d'utilisateur pour le config
email='' #email pour le config

echo "===> Creation des config ..."
git config --global user.name "$name"
git config --global user.email "$email"
echo "Fait"

username='' #Nom d'utilisateur Github
password='' #Mot de passe Github

var=$(git remote -v | head -n 1)

strarr=$(sed 's/origin//' <<< $var)
strarr=$(sed 's/(fetch)//' <<< $strarr)
strarr=$(sed 's/https:\/\///' <<< $strarr)
strarr=${strarr//$'\t'/ } <<< $strarr
strarr=$(sed 's/ //g' <<< $strarr)

echo "===> Creation du commit et push sur github ..."
git add .
git commit -m "$commit"
git push https://$username:$password@$strarr --all
