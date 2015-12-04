#!/bin/bash
#ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s "$(xdpyinfo | grep 'dimensions:'|awk '{print $2}')" -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -pix_fmt yuv420p  -preset lossless_ultrafast -threads 0 output.mp4
#ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s "$(xdpyinfo | grep 'dimensions:'|awk '{print $2}')" -i :0.0 -acodec pcm_s16le output.wav
ffmpeg \
  -y \
  -f x11grab \
  -r 30 \
  -s "$(xdpyinfo | grep 'dimensions:'|awk '{print $2}')" \
  -i :0.0 \
  -vcodec libx264 \
  -pix_fmt yuv420p \
  -b:v 4M \
  -minrate 4M \
  -maxrate 4M \
  -bufsize 4M \
  -an \
  -qscale 0 \
  -threads 0 \
  screenRecording.mp4