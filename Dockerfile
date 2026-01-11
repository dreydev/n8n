FROM node:24-bullseye

# Base working directory
WORKDIR /usr/src/app

# Enable pnpm via corepack
RUN corepack enable

# Copy the repository
COPY . .

# Move into the actual n8n root
WORKDIR /usr/src/app/n8n

# Install dependencies
RUN pnpm install

# Build n8n
RUN pnpm build

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "run", "start"]

