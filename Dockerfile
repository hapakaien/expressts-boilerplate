FROM node:lts-alpine as build

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN apk --no-cache add curl && \
			curl -L https://unpkg.com/@pnpm/self-installer | node && \
			pnpm config set store-dir ~/.pnpm-store

# Install dependencies
COPY package*.json ./
COPY pnpm-*.yaml ./
RUN pnpm i --frozen-lockfile

# Bundle app source
COPY . .

# TypeScript
RUN pnpm build


FROM node:lts-alpine

# Set ARG
ARG PORT=3000

# Set env
ENV PORT=$PORT

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN apk --no-cache add curl && \
			curl -L https://unpkg.com/@pnpm/self-installer | node && \
			pnpm config set store-dir ~/.pnpm-store

# Install dependencies
COPY package*.json ./
COPY pnpm-*.yaml ./
RUN pnpm i --frozen-lockfile -P && \
			pnpm add --global pm2

# Copy builded code
COPY --from=build /usr/src/app/build .

EXPOSE $PORT
CMD [ "pm2-runtime", "app.js" ]