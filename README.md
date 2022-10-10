# thumbs-generator
## Présentation
thumbs-generator permet de générer à partir d'un dossier contenant des photos et des dossiers contenant des photos, une copie parfaite du dossier (récursivement) dans lequel les photos/images sont compressées.
## Installation
Pour commencer, il faut installer le jpegotim,
```bash
$sudo apt install jpegoptim
```
Ensuite il faut installer thumbs-generator
```bash
$git clone https://github.com/baptistereb/thumbs-generator/
```
Déplacez le dans /usr/bin par exemple afin qu'il soit executable partout dans votre machine en le renommant "thumbs"
```bash
$mv thumbgenerator.sh /usr/bin/thumbs.sh
```

## Utilisation
```bash
$thumbs REP1 REP2 SIZE
```
| ARGUMENT     | INDISPENSABLE | PARAMETRE PAR DEFAUT | DESCRIPTION                                                                    |
| :----------- |:-------------:|:--------------------:|:-------------------------------------------------------------------------------|
| REP1         | oui           |                      | emplacement du répertoire à copier et compresser                               |
| REP2         | non           | thumbs               | emplacement du répertoire à créer dans lequel seront les images compressées    |
| SIZE         | non           | 3                    | taille en Ko ou % (ex : 3 => 3ko; 3% => 3% de la taille initiale               |
