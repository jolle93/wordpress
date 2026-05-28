# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A minimal custom WordPress Docker image based on `wordpress:apache`. The only customization is a PHP config override (`custom.ini`) that increases upload and memory limits for WordPress.

## Build & Run

```bash
# Build locally
docker build -t wordpress-custom .

# Run with a database (requires a MySQL/MariaDB container or docker-compose)
docker run -e WORDPRESS_DB_HOST=db \
           -e WORDPRESS_DB_USER=wordpress \
           -e WORDPRESS_DB_PASSWORD=secret \
           -e WORDPRESS_DB_NAME=wordpress \
           -p 8080:80 wordpress-custom
```

## Release / CI

Docker images are built and pushed to Docker Hub automatically via GitHub Actions when a git tag is pushed. Requires three repository secrets: `DOCKERHUB_USER`, `DOCKERHUB_TOKEN`, `DOCKERHUB_REPOSITORY`.

To trigger a release:
```bash
git tag v1.2.3
git push origin v1.2.3
```

Images are published for `linux/amd64` and `linux/arm64`.

## PHP Configuration

`custom.ini` is copied into the container at `$PHP_INI_DIR/conf.d/`. Adjust values there to change PHP limits (memory, upload size, execution time).
