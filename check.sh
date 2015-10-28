#!/bin/bash

function pause()  {
  echo "Appuyer la touche <Entrée> pour continuer..."
  read touche
  case $touche in
  *)	echo "Reprise du script..."
 	;;
  esac
}

SRC_PATH="frontend/src/"
BIN_DIR="./frontend/bin"
$BIN_DIR/phpmd $SRC_PATH text cleancode, codesize, controversial, design, naming, unusedcode
pause
$BIN_DIR/phploc $SRC_PATH
pause
$BIN_DIR/phpcs --standard=frontend/vendor/leaphub/phpcs-symfony2-standard/leaphub/phpcs/Symfony2/ --extensions=php $SRC_PATH
pause
$BIN_DIR/phpcpd $SRC_PATH

 
