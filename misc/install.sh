#!/bin/sh
set -e

cd /tmp

if hash curl 2>/dev/null; then
  curl -SsL https://www.entropic.dev/ds-latest.tgz -o ds-latest.tgz
elif hash wget 2>/dev/null; then
  wget https://www.entropic.dev/ds-latest.tgz -o ds-latest.tgz
else
  echo 'Please install curl or wget!'
  exit 1
fi

# engine-strict config forces checking against engines.node version constraint
NPM_CONFIG_ENGINE_STRICT=true npm install -g ds-latest.tgz
