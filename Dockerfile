FROM caddy:alpine

ARG USERNAME
ARG HASHED_PASSWORD
ARG SALT

RUN apk add --no-cache gettext

COPY Caddyfile.template /etc/caddy/

EXPOSE 5001

CMD ["sh", "-c", "envsubst < /etc/caddy/Caddyfile.template > /etc/caddy/Caddyfile && caddy run --config /etc/caddy/Caddyfile"]
