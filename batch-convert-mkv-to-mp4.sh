#!/bin/bash

for file in *.mkv; do
  title=$(echo "${file}" | cut -d '.' -f 1)

  echo "Converting ${title}..."
  ffmpeg \
  -i "${title}.mkv" \
  -c copy \
  -map 0 \
  -metadata:s:a:0 handler_name="PC Audio + Mic" \
  -metadata:s:a:1 handler_name="PC Audio" \
  -metadata:s:a:2 handler_name="Mic" \
  -video_track_timescale 60 \
  "${title}.mp4"

  echo "Deleting original..."
  if [[ -f "${title}.mp4" ]]; then
    rm -f "${file}"
  fi
done
