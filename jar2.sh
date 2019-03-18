#!/bin/bash
# jar2
#
# Descricao: jar2

 
case $1 in
start)
cd $CAMINHO
/bin/bash $CAMINHO/jar2-start.sh
;;
stop)
/bin/bash $CAMINHO/jar2-stop.sh
;;
restart)
/bin/bash $CAMINHO/jar2-stop.sh
/bin/bash $CAMINHO/jar2-start.sh
;;
esac
exit 0
