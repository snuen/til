#!/bin/bash

# Script to create a new monthly TIL markdown file if it doesn't exist

# Get current year and month
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
MONTH_NAME=$(date +"%B")
DAY=$(date +"%d")
FULL_DATE=$(date +"%Y-%m-%d")

# Create year directory if it doesn't exist
if [ ! -d "$YEAR" ]; then
  mkdir -p "$YEAR"
  echo "Created directory for year $YEAR"
fi

# Check if the monthly file exists
FILE_PATH="$YEAR/$MONTH.md"
if [ -f "$FILE_PATH" ]; then
  echo "Monthly file $FILE_PATH already exists."
else
  # Create the monthly file with template
  cat > "$FILE_PATH" << EOL
# $MONTH_NAME $YEAR TIL (Today I Learned)

This file contains things I learned during $MONTH_NAME $YEAR.

---

## $FULL_DATE: [Topic Title]

[Description of what you learned today]

### Example/Code (if applicable)

\`\`\`
# Code example here
\`\`\`

### References

- [Reference link 1](https://example.com)
- [Reference link 2](https://example.com)

---

<!-- Template for new entries -->
<!--
## $YEAR-$MONTH-XX: [Topic Title]

[Description of what you learned today]

### Example/Code (if applicable)

\`\`\`
# Code example here
\`\`\`

### References

- [Reference link 1](https://example.com)
- [Reference link 2](https://example.com)
-->
EOL

  echo "Created new monthly file: $FILE_PATH"
fi

echo "Done!"
