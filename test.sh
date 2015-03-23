#!/usr/bin/env bash
SAMPLE_LENGTH=1.596125
SAMPLE_MAXAMP=0.490417
SAMPLE_MAXDEL=0.980408

rm sample.wav
sox stereo.wav -c 1 mono.wav
sox mono.wav out.wav silence 1 0.1 1% 1 1.0 1% : newfile : restart
mv out002.wav sample.wav
rm out*
rm stereo.wav
rm mono.wav

LATEST_LENGTH="$(sox sample.wav -n stat 2>&1 | sed -n 's#^Length (seconds):[^0-9]*\([0-9.]*\)$#\1#p')"
LATEST_MAXAMP="$(sox sample.wav -n stat 2>&1 | sed -n 's#^Maximum amplitude:[^0-9]*\([0-9.]*\)$#\1#p')"
LATEST_MAXDEL="$(sox sample.wav -n stat 2>&1 | sed -n 's#^Maximum delta:[^0-9]*\([0-9.]*\)$#\1#p')"

LENGTH=`echo "$SAMPLE_LENGTH $LATEST_LENGTH" | awk '{printf "%f", $1 - $2}' | sed 's/-//g'`
echo $LENGTH

MAXAMP=`echo "$SAMPLE_MAXAMP $LATEST_MAXAMP" | awk '{printf "%f", $1 - $2}'| sed 's/-//g'`
echo $MAXAMP

MAXDEL=`echo "$SAMPLE_MAXDEL $LATEST_MAXDEL" | awk '{printf "%f", $1 - $2}'| sed 's/-//g'`
echo $MAXDEL

