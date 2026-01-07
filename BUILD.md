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

## Site Structure

### Navigation

The left navigation sidebar is configured in `docs/_data/navigation.yml`. To add or modify navigation items:

1. Edit `docs/_data/navigation.yml`
2. Add top-level items under `main:`
3. Add child items under a parent's `children:` array for nested navigation

Example structure:

```yaml
main:
  - title: "Page Title"
    url: /page-path/
  - title: "Parent with Children"
    url: /parent-path/
    children:
      - title: "Child Page"
        url: /parent-path/child/
```

The navigation automatically renders based on this configuration.

Note: The dinky theme has limited support for expand/collapse functionality in the navigation sidebar. Child items are always visible when a parent has children defined.

- Use the navigation bar for main navigation items only, not an exhaustive list of all pages
- Keep it focused (typically 5-8 top-level items) and limit children per parent since they're always visible
