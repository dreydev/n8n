FROM node:24-bullseye

WORKDIR /usr/src/app

RUN corepack enable

COPY . .

RUN pnpm install
RUN pnpm build

EXPOSE 5678

CMD ["pnpm", "run", "start"]
