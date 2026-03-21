FROM node:24-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

FROM base AS build
WORKDIR /app
COPY . /app

RUN corepack enable
RUN apk add --no-cache python3 alpine-sdk

RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --prod --frozen-lockfile

RUN pnpm deploy --filter=@imput/cobalt-api --prod /prod/api

FROM base AS api
WORKDIR /app

COPY --from=build --chown=node:node /prod/api /app
RUN mkdir -p /app/.git/logs /app/.git/refs/heads && chown -R node:node /app/.git

USER node

EXPOSE 9000
CMD ["sh", "-lc", "set -eu; BRANCH=${GIT_BRANCH:-${RENDER_GIT_BRANCH:-main}}; COMMIT=${GIT_COMMIT_SHA:-${RENDER_GIT_COMMIT:-0000000000000000000000000000000000000000}}; REMOTE=${GIT_REMOTE_URL:-${RENDER_GIT_REPO_URL:-https://github.com/liubquanti/White-Cobalt-Instance}}; mkdir -p /app/.git/logs /app/.git/refs/heads; printf 'ref: refs/heads/%s\n' \"$BRANCH\" > /app/.git/HEAD; printf '%s\n' \"$COMMIT\" > \"/app/.git/refs/heads/$BRANCH\"; printf '0000000000000000000000000000000000000000 %s Render <render@local> %s +0000\tclone: from %s\n' \"$COMMIT\" \"$(date +%s)\" \"$REMOTE\" > /app/.git/logs/HEAD; printf '[core]\n\trepositoryformatversion = 0\n\tfilemode = true\n\tbare = false\n\tlogallrefupdates = true\n[remote \"origin\"]\n\turl = %s\n\tfetch = +refs/heads/*:refs/remotes/origin/*\n' \"$REMOTE\" > /app/.git/config; exec node src/cobalt"]