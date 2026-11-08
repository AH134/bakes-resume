#!/bin/bash

# Usage: ./watch.sh <job-id> <company-name> <job-title>
# Example: ./watch.sh "12345" "Google DeepMind" "Software Engineer"

sanitize() {
  echo "$1" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]-'
}

RAW_COMPANY="$2"
RAW_TITLE="$3"
JOB_ID=$(sanitize "$1")
COMPANY=$(sanitize "$2")
TITLE=$(sanitize "$3")

if [ -z "$JOB_ID" ] || [ -z "$COMPANY" ] || [ -z "$TITLE" ]; then
  echo "Usage: $0 <job-id> <company-name> <job-title>"
  exit 1
fi

FOLDER_NAME="${JOB_ID}-${COMPANY}-${TITLE}"
TARGET="applications/${FOLDER_NAME}"
SUBMISSION_DIR="${JOB_ID}-${COMPANY}-submission"
TODAY=$(date +%Y-%m-%d)

# Bail if application already exists
if [ -d "$TARGET" ]; then
  echo "Error: ${TARGET} already exists"
  exit 1
fi

mkdir -p "$TARGET/$SUBMISSION_DIR"
echo "${1} - ${RAW_COMPANY} - ${RAW_TITLE}" > "$TARGET/$SUBMISSION_DIR/.package"
echo "$COMPANY" > "$TARGET/.company"

# Copy both for tailoring
cp src/cover-letter.typ "$TARGET/cover-letter.typ"
cp src/resume.typ "$TARGET/resume.typ"

# Generate notes
cat > "$TARGET/notes.md" << EOF
# ${COMPANY} — ${TITLE}

**Job ID:** ${JOB_ID}
**Applied:** ${TODAY}
**Contact:** 
**Status:** active

## Timeline
<!-- - YYYY-MM-DD: Applied | Screening | Interview | Offer — optional detail -->
- ${TODAY}: Applied

## Notes

EOF

echo "Created ${TARGET}"
echo "Watching cover letter and resume — Ctrl+C to stop"

trap "kill 0" EXIT

typst watch "$TARGET/cover-letter.typ" "$TARGET/$SUBMISSION_DIR/${COMPANY}-cover-letter.pdf" --root . &
typst watch "$TARGET/resume.typ" "$TARGET/$SUBMISSION_DIR/${COMPANY}-resume.pdf" --root .