# Build Instructions

## Local Development

### Setup

- Install Ruby and Bundler (Ubuntu):

```bash
sudo apt install ruby ruby-dev build-essential
sudo gem install bundler
```

- Configure and install:

```bash
bundle config set --local path 'vendor/bundle'
./scripts/serve.sh
```

- View at `http://localhost:4000`

## GitHub Pages

Automatically deployed when content is pushed:

- Profile: `https://github.com/ros-physical-ai`
- Docs: `https://ros-physical-ai.github.io`

## Pre-commit

```bash
pip install pre-commit
pre-commit install
```
