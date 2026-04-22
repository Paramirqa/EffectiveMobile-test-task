#!/usr/bin/env bash

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
  echo ".env already exists. Skipping creation."
  exit 0
fi

cat <<EOF > $ENV_FILE
COMPOSE_PROJECT_NAME=effective-mobile

NGINX_PORT=80
BACKEND_PORT=8080
EOF

echo ".env file created successfully."