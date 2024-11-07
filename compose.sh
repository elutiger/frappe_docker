#!/bin/bash

export CUSTOM_IMAGE='frappe/erpnext'
export CUSTOM_TAG='v15'
export PULL_POLICY='missing'
export PUBLISH_TIME=$(date +"%Y%m%d%H%M%S")
docker compose -f compose.yaml \
  -f overrides/compose.mariadb.yaml \
  -f overrides/compose.redis.yaml \
  -f overrides/compose.proxy.yaml \
  config > ~/gitops/docker-compose.yaml

echo "~/gitops/docker-compose_{$PUBLISH_TIME}.yaml created successfully!"
cp ~/gitops/docker-compose.yaml ./compose-custom-1.0.0.yaml