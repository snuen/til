# Today I Learned (TIL)

A collection of concise write-ups on small things I learn day to day across various languages and technologies.

## Structure

The content is organized by year and month:

```txt
/2025
  /05.md  # May 2025
  /06.md  # June 2025
  ...
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

This project includes tools for linting and formatting markdown files to maintain consistent style:

- **markdownlint**: Checks markdown files for style issues
- **prettier**: Formats markdown files consistently

Run the following commands to lint and format markdown files:

```bash
# Lint markdown files
npm run lint

# Lint and fix markdown files
npm run lint:fix

# Format markdown files
npm run format

# Run both linting and formatting
npm run check
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
