FROM node:8.9.1
USER node
RUN mkdir /home/node/code
ADD . /home/node/code
RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
RUN npm update
RUN npm install -g @angular/cli

WORKDIR /home/node/code
RUN npm install
#RUN ng serve --port 8080
CMD ["ng", "serve", "--port 8080"]
