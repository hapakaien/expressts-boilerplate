# Build stage
FROM docker.io/library/node:16-alpine as build

# Install pnpm
RUN npm install -g pnpm@latest

# Set workdir
WORKDIR /app

# Copy pnpm files
COPY package.json pnpm-lock.yaml /app/

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy other files
COPY . /app

# Build code
RUN pnpm build


# Prod depedencies steps
FROM docker.io/library/node:16-alpine as dep

# Install pnpm
RUN npm install -g pnpm@latest

# Set workdir
WORKDIR /app

# Copy pnpm files
COPY package.json pnpm-lock.yaml /app/

# Install dependencies
RUN pnpm install --frozen-lockfile --prod


# Production stage
FROM gcr.io/distroless/nodejs:14

# Set ARG
ARG PORT=3000

# Set env
ENV PORT=$PORT

# Copy needed files from build stage
COPY --from=dep /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist

# Set workdir
WORKDIR /app

# Expose port
EXPOSE $PORT

# Run
CMD [ "dist/app" ]
