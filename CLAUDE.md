# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Today I Learned (TIL)** repository that combines markdown-based content management with a simple API server.
The project serves as a personal knowledge collection system with structured daily learning entries.

## Architecture

**Content Structure:**

- Monthly markdown files organized in year directories (`/2025/05.md`, `/2025/06.md`, etc.)
- Each file contains daily TIL entries with consistent formatting
- Template-based entry creation with automated file generation

**API Server:**

- Minimal Hono-based TypeScript server (`src/app.ts`)
- Serves TIL content via REST endpoints: `GET /api/:year/:month`
- Configured for both development (port 3000) and production (port 8080)
- Docker-ready with multi-interface binding (`0.0.0.0`)

## Essential Commands

**Development:**

```bash
# Start development server with hot reload
bun run dev

# Run tests
bun run test

# Run tests with coverage
bun run coverage
```

**Content Management:**

```bash
# Create new monthly TIL file with template
sh bin/create_monthly_file.sh

# Lint markdown files
bun run lint
bun run lint:fix

# Format markdown files
bun run format

# Run both linting and formatting
bun run check
```

**Docker Operations:**

```bash
# Build and run in container
docker build -t til-app .
docker run -d -p 8080:8080 til-app
```

## Development Environment

**Tool Management:**

- Uses `mise` for version management (Bun 1.2.17 specified in `mise.toml`)
- Run `mise install` to ensure correct tool versions

**TypeScript Configuration:**

- Configured for modern ESNext with bundler module resolution
- Strict type checking enabled with `noUncheckedIndexedAccess`
- Optimized for Bun runtime environment

**Testing:**

- Vitest with globals enabled
- Test files follow `*.test.ts` pattern
- Coverage reporting available

## API Endpoints

- `GET /` - Health check endpoint
- `GET /api/:year/:month` - Retrieve TIL content for specific month
- Server binds to `0.0.0.0` for Docker compatibility
- Port configurable via `PORT` environment variable

## Content Guidelines

**Entry Format:**

```markdown
## YYYY-MM-DD: [Topic Title]

[Description of what you learned]

### Example/Code (if applicable)

### References
```

**File Organization:**

- Monthly files use numeric format: `05.md`, `06.md`
- Template comments included for consistent formatting
- Automated markdown linting enforces style consistency

## Key Files

- `src/app.ts` - Main API server implementation
- `bin/create_monthly_file.sh` - Monthly file generation script
- `package.json` - Contains all development commands
- `mise.toml` - Tool version specifications
- `Dockerfile` - Production container configuration
