FROM kahatie/debian-java
MAINTAINER kahatie <kahatie@gmail.com>

RUN apt-get update && apt-get install -y\
 curl\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*
 
RUN mkdir -p /opt/minecraft \
    && curl -SL http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.9-11.15.1.1762/forge-1.8.9-11.15.1.1762-installer.jar -o /opt/minecraft/forge-installer.jar  \
    && chmod ug+x /opt/minecraft/forge-installer.jar \
    && cd /opt/minecraft \
    && java -jar forge-installer.jar --installServer \
    && rm forge-installer.jar \
    && mv forge*.jar forge-server.jar

COPY  eula.txt /opt/minecraft/eula.txt
COPY minecraft-supervisord.conf /etc/supervisor/conf.d/minercaft-supervisord.conf
