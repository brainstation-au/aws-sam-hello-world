FROM amazon/aws-sam-cli-build-image-nodejs14.x:latest

LABEL maintainer="brainstation<brainstation@outlook.com.au>"

WORKDIR /opt/code

COPY dist ./dist/
COPY package-lock.json package.json ./

RUN npm install --only=prod
