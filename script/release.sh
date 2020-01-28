#!/usr/bin/env bash

set -e

export TAG=$(script/release/next-docker-tag.sh)
echo "Releasing tag ${TAG}"
script/release/generate-changelog.sh
git add CHANGELOG.md && git commit -m "chore(changelog): update for ${TAG}"
echo "Tagging version ${TAG}"
git tag -a "${TAG}" -m "Releasing version ${TAG}" && git push origin "${TAG}"
