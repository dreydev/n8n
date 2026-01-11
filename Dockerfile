# 1. Use supported Node version
FROM node:24-bullseye

# 2. Set working directory
WORKDIR /usr/src/app

# 3. Enable pnpm via corepack
RUN corepack enable

# 4. Copy only the n8n folder into container root
COPY n8n/ .

# 5. Limit memory for Node build to avoid OOM
ENV NODE_OPTIONS="--max-old-space-size=2048"

# 6. Install pnpm dependencies without optional packages (faster and lighter)
RUN pnpm install --frozen-lockfile --prefer-offline --no-optional

# 7. Build n8n (TypeScript compilation)
RUN pnpm build

# 8. Expose n8n default port
EXPOSE 5678

# 9. Start n8n
CMD ["pnpm", "run", "start"]


