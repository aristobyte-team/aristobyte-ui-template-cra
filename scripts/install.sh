#!/usr/bin/env bash

# ======================================= #
# AristoByteUI dev dependencies installer #
# ======================================= #

set -e

usage() {
  echo "Usage: $0 <package-manager>"
  echo "Where <package-manager> is one of: bun, yarn, npm, pnpm"
  exit 1
}

# -------------- #
# Validate input #
# -------------- #
if [ $# -ne 1 ]; then
  usage
fi

PM=$1

case "$PM" in
  bun|yarn|npm|pnpm)
    echo "Selected package manager: $PM"
    ;;
  *)
    echo "❌ Invalid package manager: $PM"
    usage
    ;;
esac

# ---------------------------------- #
# Packages to install (dependencies) #
# ---------------------------------- #
PACKAGES=(
  "@aristobyte-ui/anchor"
  "@aristobyte-ui/button"
  "@aristobyte-ui/card"
  "@aristobyte-ui/label"
  "@aristobyte-ui/utils"
  "next@^15.5.2"
  "react@^19.1.0"
  "react-dom@^19.1.0"
  "sass@^1.92.1"
)

# ------------------------------------------ #
# Dev Packages to install (dev dependencies) #
# ------------------------------------------ #
DEV_PACKAGES=(
  "@aristobyte-ui/eslint-config"
  "@aristobyte-ui/typescript-config"
  "@svgr/webpack@^8.1.0"
  "@types/node@^22.15.29"
  "@types/react@^19.1.6"
  "@types/react-dom@^19.1.6"
  "eslint@^9.27.0"
  "raw-loader@^4.0.2"
  "typescript@5.8.2"
)

# ---------------- #
# Install packages #
# ---------------- #
echo "Installing dependencies: ${DEV_PACKAGES[*]}"
echo "Installing dev dependencies: ${DEV_PACKAGES[*]}"

case "$PM" in
  npm)
    npm install "${PACKAGES[@]}" && npm install --save-dev "${DEV_PACKAGES[@]}"
    ;;
  yarn)
    yarn add "${PACKAGES[@]}" && yarn add -D "${DEV_PACKAGES[@]}"
    ;;
  pnpm)
    pnpm add "${PACKAGES[@]}" && pnpm add -D "${DEV_PACKAGES[@]}"
    ;;
  bun)
    bun add "${PACKAGES[@]}" && bun add -d "${DEV_PACKAGES[@]}"
    ;;
esac

echo "✅ Dev dependencies installed successfully!"
