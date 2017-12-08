FROM node:9.2.0-alpine

RUN apk add --no-cache git
RUN curl -Lo package.json https://raw.githubusercontent.com/JeremyEnglert/JointsWP/5.0/package.json
RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install --quiet node-gyp -g && \
  npm install --quiet gulp-cli -g && \
  npm install --quiet && \
  apk del native-deps
