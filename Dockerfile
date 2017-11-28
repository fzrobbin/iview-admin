# Dockerfile.alpine
FROM index.tenxcloud.com/docker_library/alpine:edge

# Install Node.js apk
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >>/etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --no-cache nodejs-lts@edge

# Create App directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#Install app depencides
COPY package.json /usr/src/app/
RUN npm install

#Bundle app source
COPY . /usr/src/app/

#Expose port
EXPOSE 8080

CMD ["npm","start"]
