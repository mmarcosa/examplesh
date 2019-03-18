#!/bin/bash
# jar1
#
# Descricao: 

 
case $1 in
start)
cd $CAMINHO
/bin/bash jar1-start.sh
;;
stop)
/bin/bash $CAMINHO/jar1-stop.sh
;;
restart)
/bin/bash $CAMINHO/jar1-stop.sh
/bin/bash $CAMINHO/jar1-start.sh
;;
esac
exit 0
