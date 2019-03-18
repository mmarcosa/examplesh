#!/bin/sh

#script de instalacao para colocar arquivos .jar como servico em distribuicoes linux
echo Iniciando instalacao

#VARIAVEIS

#caminho de instalacao
CAMINHO=$(pwd)

#diretorio do java
JAVA=/jre1.8/bin

#diretorio do scope-client
JAR1=/jar1

#diretorio do scope-connector
JAR2=/jar2

#arquivo de log
LOG="log-instalacao.log"

#Arquivos antigos, em caso de segunda instalacao
JAR2ANTIGO=/etc/init.d/jar2.sh
JAR1ANTIGO=/etc/init.d/jar1.sh

#PARAMETROS
#Os parametros podem ser:
# 1 - Instala o jar1  e o jar2 sem o Java
# 2 - Instala o jar1 e o jar2 com o Java
# 3 - Instala o jar1 sem o java
# 4 - Instala o jar1 com o java
# 5 - Instala o jar2 sem o java
# 6 - Instala o jar2 com o java

#permissoes para o diretorio, subdiretorios e arquivos
chmod -R 777 $CAMINHO/*

#VALIDACOES

#Verifica se existe lixo
if [ -e "$JAR1ANTIGO" ]
  then
	sudo rm $JAR1ANTIGO
fi

if [ -e "$JAR2ANTIGO" ]
  then
	sudo rm $JAR2ANTIGO
fi

#Verifica se a variavel caminho esta setada
sed -i '/CAMINHO=/d' jar1.sh
sed -i '/CAMINHO=/d' jar2.sh

#Verifica se o comando java ja foi setado
sed -i '/nohup/d' $CAMINHO$JAR1/jar1-start.sh
sed -i '/nohup/d' $CAMINHO$JAR2/jar2-start.sh

#verifica se o servico esta no arquivo de inicializacao
sed -i '/scope/d' /etc/rc.d/rc.local


if [ "$1" == "1" ]
  then
	echo opcao 1 = instalando jar1 e jar2 sem java
	echo opcao 1 = instalando jar1 e jar2 sem java >> "$CAMINHO/$LOG"

	echo colocanco o caminho nos arquivos do jar1 e jar2 >> "$CAMINHO/$LOG"

	#modifica o arquivo que sera copiado para /etc/init.d
	sed -i "5i CAMINHO=$CAMINHO$JAR1" $CAMINHO/jar1.sh

	#modifica o arquivo que sera copiado para /etc/init.d/
	sed -i "5i CAMINHO=$CAMINHO$JAR2" $CAMINHO/jar2.sh

	#modifica o arquivo que inicia o servico
	sed -i "3i nohup java -Dlog4j.configuration=file:"./log4j.properties" -jar jar1.jar &" $CAMINHO$JAR1/jar1-start.sh
	sed -i "3i nohup java -Dlog4j.configuration=file:"./log4j.properties" -jar jar2.jar &" $CAMINHO$JAR2/jar2-start.sh

	echo movendo arquivos: >> "$CAMINHO/$LOG"

	echo jar1 >> "$CAMINHO/$LOG"
	cp $CAMINHO/jar1.sh /etc/init.d/

	echo jar2 >> "$CAMINHO/$LOG"
	cp $CAMINHO/jar2.sh /etc/init.d/

	echo colocando servico na inicializacao do SO
	chmod 777 /etc/rc.d/rc.local
	echo /etc/init.d/jar1.sh start >> /etc/rc.d/rc.local
        echo /etc/init.d/jar2.sh start >> /etc/rc.d/rc.local

	echo Instalacao concluida.

  elif [ "$1" == "2" ]
    then
          echo opcao 2 = instalando jar1 e jar2 com java
	  echo opcao 2 = instalando jar1 e jar2 com java >> "$CAMINHO/$LOG"

	  echo colocanco o caminho nos arquivos do jar1 e jar2 >> "$CAMINHO/$LOG"

  	  #modifica o arquivo que sera copiado para /etc/init.d/
          sed -i "5i CAMINHO=$CAMINHO$JAR1" jar1.sh

	  #modifica o arquivo que sera copiado para /etc/init.d
          sed -i "5i CAMINHO=$CAMINHO$JAR2" jar2.sh

	  #modifica o arquivo que inicia o servico
          sed -i "3i nohup $CAMINHO$JAVA/java -Dlog4j.configuration=file:"./log4j.properties" -jar jar1.jar &" $CAMINHO$JARR1/jar1-start.sh
          sed -i "3i nohup $CAMINHO$JAVA/java -Dlog4j.configuration=file:"./log4j.properties" -jar jar2.jar &" $CAMINHO$JAR2/jar2-start.sh

	  echo movendo arquivos: >> "$CAMINHO/$LOG"

	  echo jar1 >> "$CAMINHO/$LOG"
	  cp $CAMINHO/jar1.sh /etc/init.d/

	  echo jar2 >> "$CAMINHO/$LOG"
	  cp $CAMINHO/jar2.sh /etc/init.d/

          echo colocando servico na inicializacao do SO
          chmod 777 /etc/rc.d/rc.local
          echo /etc/init.d/jar1.sh start >> /etc/rc.d/rc.local
          echo /etc/init.d/jar2.sh start >> /etc/rc.d/rc.local

	  echo Instalacao concluida.

    elif [ "$1" == "3" ]
     then
            echo opcao 3 = instalando jar1 sem java
	    echo opcao 3 = instalando jar1 sem java >> "$CAMINHO/$LOG"

            echo colocanco o caminho nos arquivos do jar1 >> "$CAMINHO/$LOG"

	    #modifica arquivo que sera copiado para /etc/init.d/
            sed -i "5i CAMINHO=$CAMINHO" jar1.sh

	    #modifica o arquivo que inicia o servico
	    sed -i "3i nohup java -Dlog4j.configuration=file:"./log4j.properties" -jar jar1.jar &" $CAMINHO$JAR1/jar1-start.sh

	    echo movendo arquivos: >> "$CAMINHO/$LOG"

	    echo jar1 >> "$CAMINHO/$LOG"
            cp $CAMINHO/jar1.sh /etc/init.d

	    echo colocando servico na inicializacao do SO
            chmod 777 /etc/rc.d/rc.local
            echo /etc/init.d/jar1.sh start >> /etc/rc.d/rc.local

	    echo Instalacao concluida.

	elif [ "$1" == "4" ]
	  then
		echo opcao 4 = instalando jar1 com java
		echo opcao 4 = instalando jar1 com java >> "$CAMINHO/$LOG"

	        echo colocanco o caminho nos arquivos do jar1 >> "$CAMINHO/$LOG"

		#modifica o arquivo que sera copiado para /etc/init.d
	        sed -i "5i CAMINHO=$CAMINHO$JAR1" jar1.sh

		#modifica o arquivo que inicia o servico
		sed -i "3i nohup $CAMINHO/$JAVA/java -Dlog4j.configuration=file:"./log4j.properties" -jar jar1.jar &" $CAMINHO$JAR1/jar1-start.sh

        	echo movendo arquivos: >> "$CAMINHO/$LOG"

	        echo jar1 >> "$CAMINHO/$LOG"
		cp $CAMINHO/jar1.sh /etc/init.d 

        	echo colocando servico na inicializacao do SO
	        chmod 777 /etc/rc.d/rc.local
       		echo /etc/init.d/jar1.sh start >> /etc/rc.d/rc.local

		echo Instalacao concluida.

		elif [ "$1" == "5" ]
		  then 
			echo opcao 5 = instalando jar2 sem java
			echo opcao 5 = instalando jar2 sem java >> "$CAMINHO/$LOG"

		        echo colocando o caminho nos arquivos do client >> "$CAMINHO/$LOG"

		        #modifica o arquivo que sera copiado para /etc/init.d
		        sed -i "5i CAMINHO=$CAMINHO$JAR2" $CAMINHO/jar2.sh

			#modifica o arquivo que inicia o servico
			sed -i "3i nohup java -Dlog4j.configuration=file:"./log4j.properties" -jar jar2.jar &" $CAMINHO$JR2/jar2-start.sh

			echo movendo arquivos: >> "$CAMINHO/$LOG"

 			echo jar2 >> "$CAMINHO/$LOG"
		        cp $CAMINHO/jar2.sh /etc/init.d/


		        echo colocando servico na inicializacao do SO
        		chmod 777 /etc/rc.d/rc.local
		        echo /etc/init.d/jar2.sh start >> /etc/rc.d/rc.local

			echo Instalacao concluida.

			elif [ "$1" == "6" ]
			  then
				 echo opcao 6 = instalando jar2 com java
			         echo opcao 6 = instalando jar2 com java >> "$CAMINHO/$LOG"

			         echo colocanco o caminho nos arquivos do client e connector >> "$CAMINHO/$LOG"

			         #modifica o arquivo que sera copiado para /etc/init.d/
			         sed -i "5i CAMINHO=$CAMINHO$JAR2" jar2.sh

			         #modifica o arquivo que incia o servico
			         sed -i "3i nohup $CAMINHO$JAVA/java -Dlog4j.configuration=file:"./log4j.properties" -jar jar2.jar &" $CAMINHO$JAR2/jar2-start.sh

			         echo movendo arquivos: >> "$CAMINHO/$LOG"

			         echo jar2 >> "$CAMINHO/$LOG"
			         cp $CAMINHO/jar2.sh /etc/init.d/

			        echo colocando servico na inicializacao do SO
			        chmod 777 /etc/rc.d/rc.local
			        echo /etc/init.d/jar2.sh start >> /etc/rc.d/rc.local

				echo Instalacao concluida.

				else
					echo parametro invalido >> "$caminho/log-instalacao.txt"
					echo parametro invalido..
					echo o parametro pode ser:
					echo 1 - Instala o jar1 e o jar2 sem o Java
					echo 2 - Instala o jar1 e o jar2 com o Java
					echo 3 - Instala o jar1 sem o java
					echo 4 - Instala o jar1 com o java
					echo 5 - Instala o jar2 sem o java
					echo 6 - Instala o jar2 com o java

fi
