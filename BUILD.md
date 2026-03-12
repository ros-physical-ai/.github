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

## Devcontainer / Docker

This is an optional approach that provides a fully reproducible build environment without needing to manually install Ruby, Bundler, or Jekyll on the host machine.

### Devcontainer (VS Code)

**Prerequisites**: [Docker](https://docs.docker.com/get-docker/) and the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension for VS Code.

1. Open the repository in VS Code.
2. When prompted, click **Reopen in Container** — or run the command
   `Dev Containers: Reopen in Container` from the Command Palette (`Ctrl+Shift+P`).
3. VS Code builds the Docker image (first time only) and opens the workspace inside
   the container. Bundle dependencies are installed automatically via `postCreateCommand`.
4. Start the local documentation server:

   ```bash
   ./scripts/serve.sh --host 0.0.0.0
   ```

5. View at `http://localhost:4000`.

> [!NOTE]
> The first `Reopen in Container` builds the Docker image and can take a few minutes. Subsequent opens reuse the cached image and start instantly.

### Docker

Build the Docker image:

```bash
docker build -t ros-physical-ai-docs -f docker/Dockerfile .
```

Run an interactive container with the repository mounted:

```bash
docker run -it --rm -p 4000:4000 -v $(pwd):/workspace ros-physical-ai-docs
```

Inside the container, start the server (gems are pre-installed in the image):

```bash
./scripts/serve.sh --host 0.0.0.0
```

View at `http://localhost:4000`.

## GitHub Pages

Automatically deployed when content is pushed:

- Profile: `https://github.com/ros-physical-ai`
- Docs: `https://physical-ai.ros.org`

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
