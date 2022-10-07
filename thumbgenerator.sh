#!/usr/bin/bash

# $1 chemin du répertoire parent
# $2 chemin du nouveau parent
# $3 taille en Ko de l'image post compression

function CreateFolder() {
  # $1 chemin du répertoire parent
  # $2 chemin du nouveau parent
  for file in `ls -R $1`; do
    if test -d $1"/"$file; then
      mkdir $2"/"$file
      echo -e "\033[36m Dossier copié : \033[1m"$1"/"$file"\033[0m"
      CreateFolder $1"/"$file $2"/"$file
    fi
  done
}

function Convert() {
  # $1 = chemin du fichier
  # $2 = chemin de l'image compressé
  # $3 = taille de la nouvelle image en Kb
  jpegoptim -S $3 $1 -d $2
  return 0
}

function RecursiveConvertFile() {
  # $1 chemin du fichier original
  # $2 chemin du dossier convertit
  # $3 = taille de la nouvelle image en Kb
  for file in `ls -R $1`; do
    if test -f $1"/"$file; then
      Convert $1"/"$file $2 $3
    elif test -d $1"/"$file; then
      RecursiveConvertFile $1"/"$file $2"/"$file $3
    fi
  done
}

#Programme principale (séquence)

if test -n "$1"; then
  rep=$1
else
   exit "Pas de dossier source"; echo "$?"
fi
if test -n "$2"; then
  newrep=$2
else
  newrep="thumbs"
  echo -e "\033[31mPas de paramétre de nouveau répertoire \033[43m=>\033[0m automatiquement à \033[34m\"thumbs\" \033[0m"
fi
if test -n "$3"; then
  size=$3
else
  size=3
  echo -e "\033[31mPas de paramétre de taille             \033[43m=>\033[0m automatiquement à \033[34m3 Kb\033[0m"
fi

mkdir $newrep                               # On créer le répertoire parent
CreateFolder $rep $newrep                   # On créer récursivement les sous-dossiers
RecursiveConvertFile $rep $newrep $size     # On convertie récursivement les images