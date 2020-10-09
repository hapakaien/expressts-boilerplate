FROM node:lts-alpine

# Set ARG
ARG PORT=3000

# Set env
ENV PORT=$PORT

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN apk --no-cache add curl
RUN curl -L https://unpkg.com/@pnpm/self-installer | node
RUN pnpm config set store-dir ~/.pnpm-store

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
COPY pnpm-*.yaml ./

RUN pnpm i --frozen-lockfile

# Bundle app source
COPY . .

# TypeScript
RUN pnpm build

EXPOSE $PORT
CMD [ "pnpm", "start" ]