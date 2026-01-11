FROM node:24-bullseye

# Set working directory
WORKDIR /usr/src/app

# Enable pnpm
RUN corepack enable

# Copy everything from the repo root
COPY . .

# Limit memory for Node build to avoid OOM
ENV NODE_OPTIONS="--max-old-space-size=2048"

# Install dependencies
RUN pnpm install --frozen-lockfile --prefer-offline --no-optional

# Build n8n
RUN pnpm build

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "run", "start"]
