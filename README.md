# examplesh
Recentemente tive que instalar alguns jars como serviço em uma distro linux.
Esses scripts instalam o jar como serviço e os iniciam em /etc/init.d/

comando para start:

/etc/init.d/jar1.sh start

comando para stop:

/etc/init.d/jar1.sh stop

restart:

/etc/init.d/jar1.sh restart

Para instalar com o script .sh:

 1. Coloque a raíz do java dentro do diretório jre1.8. 
 
 2. Coloque o conteúdo do diretório libs nos respectivos diretórios libs de cada aplicação, caso não precise de libs, não faça nada.

 3. Coloque os jars em seus respectivos diretórios.

 4. Configure os arquivos .properties de cada aplicação.

Após esses passos, a instalação pode ser feita utilizando um dos parâmetros abaixo:

1 - Instala o jar1 e o jar2 sem o Java
2 - Instala o jar1 e o jar2 com o Java
3 - Instala o jar1 sem o java
4 - Instala o jar1 com o java
5 - Instala o jar2 sem o java
6 - Instala o jar2 com o java

Exemplo: 

./install-jars.sh 1
