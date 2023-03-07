#!/bin/bash
# Simple script for deleting all previous workflow runs of a given workflow
OWNER=""
REPO=""

# List workflows for repository
gh api -X GET /repos/$OWNER/$REPO/actions/workflows | jq '.workflows[] | .name,.id'

# Copy the ID of the workflow you want to clear and set it
WORKFLOW_ID=""

# List previous runs
gh api -X GET /repos/$OWNER/$REPO/actions/workflows/$WORKFLOW_ID/runs | jq '.workflow_runs[] | .id'

# delete runs 
gh api -X GET /repos/$OWNER/$REPO/actions/workflows/$WORKFLOW_ID/runs | jq '.workflow_runs[] | .id' | xargs -I{} gh api -X DELETE /repos/$OWNER/$REPO/actions/runs/{}
