FROM ubuntu

RUN \
	apt-get update && \
	apt-get install -y \
	wget \
	unzip \
	gnupg
    
RUN \
	wget https://deb.nodesource.com/setup_8.x && \
	bash setup_8.x
  
RUN \
	apt-get update && \
	apt-get install -y nodejs
    
RUN \
	wget https://notabug.org/RemixDevs/DeezloaderRemix/archive/master.zip && \
	unzip master.zip && \
	cd /deezloaderremix && \
	bash compileLinux.sh && \
	cd / && \
	rm -rf master.zip setup_8.x && \
  ln -sf /root/.config/Deezloader\ Remix/ /config

CMD \
	/usr/bin/node /deezloaderremix/app/app.js
