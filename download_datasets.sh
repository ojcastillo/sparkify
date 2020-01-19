#!/bin/bash
set -euo pipefail

if [[ $# -ne 0 ]]; then
    FILE_TO_DOWNLOAD="sparkify_event_data.json"
else
    FILE_TO_DOWNLOAD="mini_sparkify_event_data.json"
fi

echo "Creating datasets folder (if needed)"
mkdir -p datasets

echo "Downloading http://udacity-dsnd.s3.amazonaws.com/sparkify/$FILE_TO_DOWNLOAD"
curl http://udacity-dsnd.s3.amazonaws.com/sparkify/$FILE_TO_DOWNLOAD \
    --output datasets/$FILE_TO_DOWNLOAD

