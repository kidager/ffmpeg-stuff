#!/bin/bash

if [ -f "phone_p1.mp4" ]; then
  ffmpeg \
    -loop 1 \
    -i "background.png" \
    -i "phone_p1.mp4" \
    -filter_complex [1:v]scale=290:518[a],[0:v][a]overlay=522:85:shortest=1[video] \
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
    "phone.part1.avi"
fi;

if [ -f "phone_p2.mp4" ]; then
  ffmpeg \
    -loop 1 \
    -i "background.png" \
    -i "phone_p2.mp4" \
    -filter_complex [1:v]scale=290:518[a],[0:v][a]overlay=522:85:shortest=1[video] \
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
    "phone.part2.avi"
fi;