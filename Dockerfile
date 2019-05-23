FROM node:8-alpine

RUN \
        apk add --no-cache git
	wget https://notabug.org/RemixDevs/DeezloaderRemix/archive/master.tar.gz && \
	tar -xvf master.tar.gz && \
	rm -rf master.tar.gz && \
	cd /deezloaderremix && npm install && npm run dist:linux -- --dir && \
	ln -sf /root/.config/Deezloader\ Remix/ /config

CMD node /deezloaderremix/app/app.js
