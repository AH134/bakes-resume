#!/bin/bash
# Usage: ./resume.sh <job-id>

sanitize() {
  echo "$1" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]-'
}

JOB_ID=$(sanitize "$1")

if [ -z "$JOB_ID" ]; then
  echo "Usage: $0 <job-id>"
  exit 1
fi

TARGET=$(find applications -mindepth 1 -maxdepth 2 -type d -name "${JOB_ID}-*" | head -1)

if [ -z "$TARGET" ]; then
  echo "Error: no application found with job ID ${JOB_ID}"
  exit 1
fi

COMPANY=$(cat "$TARGET/.company")
SUBMISSION_DIR="${JOB_ID}-${COMPANY}-submission"

echo "Resuming ${TARGET}"
echo "Watching cover letter and resume — Ctrl+C to stop"

trap "kill 0" EXIT

typst watch "$TARGET/cover-letter.typ" "$TARGET/$SUBMISSION_DIR/${COMPANY}-cover-letter.pdf" --root . &
typst watch "$TARGET/resume.typ" "$TARGET/$SUBMISSION_DIR/${COMPANY}-resume.pdf" --root .