#!/usr/bin/bash

# $1 = nom du dossier à modifier
# $2 = nom du nouveau répertoire
# $3 = taille maximum en Kb(ou % askip ça work) des images

newrep="thumbs"
size=3

if test -n "$1"
then
  rep=$1
else
   exit "Pas de dossier source"; echo "$?"
fi

if test -n "$2"
then
  newrep=$2
else
  echo -e "\033[31mPas de paramétre de nouveau répertoire \033[43m=>\033[0m automatiquement à \033[34m\"thumbs\" \033[0m"
fi

if test -n "$2"
then
  size=$2
else
  echo -e "\033[31mPas de paramétre de taille             \033[43m=>\033[0m automatiquement à \033[34m3 Kb\033[0m"
fi

function Convert() {
   # $1 = nom du fichier
   # $2 = nouveau dossier ou on place l'image compressé
   # $3 = taille de la nouvelle image en Kb
   jpegoptim -S $3 $1 -d $2
   return 0
}

#Programme principale (séquence)
mkdir $rep"/"$newrep

for file in `ls -R $rep`; do
   if test -f $rep"/"$file 
   then
      Convert $rep"/"$file $rep"/"$newrep $size
      echo "document : "$file >> $rep"/"$newrep"/"temp_file_thumbs_generator
   else
      echo -e "\033[33mNon traité car pas un fichier ordinaire : \033[1m"$file"\033[0m" >> $rep"/"$newrep"/"temp_file_thumbs_generator
   fi
done

#cat $rep"/"$newrep"/"temp_file_thumbs_generator

rm $rep"/"$newrep"/"temp_file_thumbs_generator