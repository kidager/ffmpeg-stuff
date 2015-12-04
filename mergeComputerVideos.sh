#!/bin/bash
# X: 270
# Y: 115
# W: 740
# H: 465

ffmpeg \
  -loop 1 \
  -i background.png \
  -i screenRecording.mp4 \
  -filter_complex [1:v]scale=830:465[a],[0:v][a]overlay=225:115:shortest=1[video] \
  -map "[video]" \
  -r 30000/1001 \
  -b:v 2M \
  -minrate 2M \
  -maxrate 2M \
  -bufsize 2M \
  -bt 4M \
  -vcodec libx264 \
  -f avi\
  -an \
  outputScreenRecording.avi