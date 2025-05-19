# Today I Learned (TIL)

A collection of concise write-ups on small things I learn day to day across various languages and technologies.

## Requirements

- [mise](https://mise.jdx.dev/) (for managing tool versions)
- [Bun](https://bun.sh/) (for running the API server and scripts)

## Version Management with mise

This project uses [mise](https://mise.jdx.dev/), a fast, cross-platform version manager, to ensure consistent versions
of tools (like Node.js, Python, Bun, etc.) across different environments. Tool versions are specified in mise.toml.

To install and use the required tool versions:

```sh
# Install mise (see official docs for latest instructions)
curl https://mise.run | sh

# Activate mise in the current shell by adding the following to your shell configuration file
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc

# Install all tools specified in mise.toml
mise install
```

## Structure

- `/2025/` — Markdown files organized by year and month (e.g., `/2025/05.md`)
- `/src/` — TypeScript source code for the API server
- `/bin/` — Utility scripts (e.g., for creating monthly files)

The content is organized by year and month:

```txt
/2025
  /05.md  # May 2025
  /06.md  # June 2025
  ...
```

## Running the API Server

The project includes a minimal API server (powered by [Hono](https://hono.dev/) and Bun) that serves TIL markdown files.

To start the development server:

```sh
bun run dev
```

- Visit [http://localhost:3000/](http://localhost:3000/) to see the welcome message.
- Access a monthly TIL file via: `GET /api/:year/:month` (e.g., `/api/2025/05`).

If the file does not exist, the API returns a 404 JSON error.

## Running with Docker

You can build and run the API server in a Docker container:

```sh
# Build the Docker image
docker build -t til-app .

# Run the container
docker run -d -p 8080:8080 til-app
```

### Docker Usage

- The server will be available at [http://localhost:8080/](http://localhost:8080/) or [http://0.0.0.0:8080/](http://0.0.0.0:8080/).
- Access endpoints the same way as the development server, but using port 8080:
  - Root endpoint: `GET http://localhost:8080/`
  - TIL entries: `GET http://localhost:8080/api/:year/:month` (e.g., `http://localhost:8080/api/2025/05`)

### Docker Commands

```sh
# List running containers
docker ps

# View container logs
docker logs CONTAINER_ID

# Stop the container
docker stop CONTAINER_ID

# Remove the container
docker rm CONTAINER_ID
```

### Troubleshooting Docker

- If you can't access the server at port 8080, check if another service is using that port:

  ```sh
  lsof -i :8080
  ```

- If you need to rebuild after code changes:

  ```sh
  docker stop $(docker ps -q --filter ancestor=til-app) # Stop running containers
  docker build -t til-app . # Rebuild image
  docker run -d -p 8080:8080 til-app # Start new container
  ```

- If you need to use a different port:

  ```sh
  docker run -d -p 3000:8080 til-app # Maps container's 8080 port to host's 3000 port
  ```

## Usage

### Adding Entries

To add a new entry, simply edit the markdown file for the current month. If the file doesn't exist yet, you can either:

1. Create it manually following the existing naming pattern
2. Use the provided script to generate it automatically:

   ```sh
   sh bin/create_monthly_file.sh
   ```

   This script will create a new markdown file for the current month with a template entry for today's date.

Each entry should include:

- Date
- Title/Topic
- Description
- Code examples (if applicable)
- References (if applicable)

## Markdown Linting and Formatting

Markdown linting and formatting are automatically enforced on every push using
[GitHub Actions](.github/workflows/markdown-check.yml). This ensures all markdown files follow consistent style and
formatting in the repository.

- **markdownlint**: Checks markdown files for style issues
- **prettier**: Formats markdown files consistently

You can also run the following commands locally to check or fix markdown files before pushing:

```sh
# Lint markdown files
bun run lint

# Lint and fix markdown files
bun run lint:fix

# Format markdown files
bun run format

# Run both linting and formatting
bun run check
```

## Example Entry Format

```markdown
## 2025-05-09: Git Interactive Rebase

Today I learned how to use Git's interactive rebase feature to clean up my commit history before pushing.

Command: `git rebase -i HEAD~3`

This opens an editor where you can:

- reorder commits
- squash multiple commits into one
- edit commit messages
- drop commits entirely

Reference: [Git Documentation](https://git-scm.com/docs/git-rebase)
```
