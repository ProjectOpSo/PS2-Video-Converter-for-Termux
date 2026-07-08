#!/data/data/com.termux/files/usr/bin/bash

SOURCE_DIR="/sdcard/Download/Movies"
OUTPUT_DIR="/sdcard/Download/Moviesg"

mkdir -p "$OUTPUT_DIR" || exit 1
[ -d "$SOURCE_DIR" ] || exit 1

shopt -s nullglob

for video in "$SOURCE_DIR"/*.{mp4,mkv,avi,webm,mov,flv,m4v}; do
    [ -f "$video" ] || continue

    output_file="$OUTPUT_DIR/$(basename "${video%.*}").avi"
    [ -f "$output_file" ] && continue

    echo "Converting: $(basename "$video")"

    ffmpeg -hide_banner -loglevel warning -nostdin -threads 0 -y \
        -i "$video" \
        -vf "scale=640:480:force_original_aspect_ratio=decrease,pad=640:480:(ow-iw)/2:(oh-ih)/2" \
        -sws_flags fast_bilinear \
        -c:v libxvid \
        -vtag XVID \
        -b:v 1200k \
        -maxrate 1200k \
        -bufsize 2400k \
        -g 300 \
        -bf 0 \
        -c:a libmp3lame \
        -b:a 128k \
        -ar 48000 \
        -ac 2 \
        "$output_file"
done

echo "Conversion completed."
