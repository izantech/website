#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing Node dependencies..."
npm ci

echo "==> Running linting..."
npm run lint

echo "==> Running unit tests..."
npm test

echo "==> Building Jekyll site..."
bundle exec jekyll build

echo "==> Starting Jekyll server for accessibility tests..."
bundle exec jekyll serve --skip-initial-build --detach

echo "==> Waiting for server to start..."
sleep 3

echo "==> Running accessibility tests..."
npm run test:a11y

echo "==> All tests passed! Build complete."
