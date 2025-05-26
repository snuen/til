FROM oven/bun:1.2.14-alpine

WORKDIR /app

COPY package.json bun.lock ./

RUN bun install

COPY src/ ./src/

EXPOSE 8080

ENV PORT=8080

CMD ["bun", "run", "src/app.ts"]
