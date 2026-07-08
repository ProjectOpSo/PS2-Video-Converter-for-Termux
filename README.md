# PS2 Video Converter for Termux

A simple and fast Bash script that automatically converts videos into a format compatible with PlayStation 2 homebrew applications and media players.

The script scans a source directory, converts every supported video to AVI (Xvid + MP3), and stores the converted files in a destination folder while skipping files that have already been processed.

---

## Features

* Fully automatic batch conversion
* Optimized for Android + Termux
* Compatible with PlayStation 2 video players
* Converts multiple video formats
* Automatically creates the output directory
* Skips files that already exist
* Uses all available CPU threads
* Clean terminal output

---

## Supported Input Formats

The script searches for the following extensions:
`MP4`, `MKV`, `AVI`, `WEBM`, `MOV`, `FLV`, `M4V`

All videos are converted into: **AVI (Xvid + MP3)**

---

## Requirements

### Android
* Android device
* Termux (Download Termux from **F-Droid** for the best compatibility)

### Install Required Packages

Update Termux:
```bash
pkg update && pkg upgrade
```

Install FFmpeg:
```bash
pkg install ffmpeg
```

*(Optional)* Install Git:
```bash
pkg install git
```

---

## Installation & Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com
   ```

2. **Enter the directory:**
   ```bash
   cd PS2-Video-Converter
   ```

3. **Make the script executable:**
   ```bash
   chmod +x converter_ps2.sh
   ```

4. **Run it:**
   ```bash
   ./converter_ps2.sh
   ```

---

## Folder Structure

Default source directory:
* `/sdcard/Download/Movies`

Default output directory:
* `/sdcard/Download/Moviesg`

You can edit these paths directly inside the script:
```bash
ORIGIN="/sdcard/Download/Movies"
DESTINATION="/sdcard/Download/Moviesg"
```

---

## Video Settings

The script converts videos using the following parameters:

| Setting | Value |
| :--- | :--- |
| **Resolution** | 640×480 |
| **Codec** | Xvid |
| **Container** | AVI |
| **Audio Codec** | MP3 |
| **Audio Bitrate** | 128 kbps |
| **Audio Sample Rate** | 48000 Hz |
| **Channels** | Stereo |
| **Video Bitrate** | 1200 kbps |
| **Threads** | Auto |

---

## Conversion Process

For each video, the script will:
1. Detect supported files.
2. Check if the converted file already exists.
3. Resize while preserving aspect ratio.
4. Add black borders when necessary.
5. Encode video using Xvid.
6. Encode audio using MP3.
7. Save as AVI.

*Note: Already converted files are skipped automatically.*

---

## Customization

You can easily modify the FFmpeg parameters inside the script.

**Examples:**
* Increase video bitrate: `-b:v 1800k`
* Change resolution: `scale=720:480`
* Change audio bitrate: `-b:a 192k`

### Supported FFmpeg Filters
Current filter used:
```text
scale=640:480:force_original_aspect_ratio=decrease,pad=640:480:(ow-iw)/2:(oh-ih)/2
```
This filter:
* Preserves the original aspect ratio
* Avoids image distortion
* Adds black borders when needed

---

## Example

### Input
```text
Movies/
 ├── Movie1.mp4
 ├── Movie2.mkv
 └── Anime.webm
```

### Output
```text
Moviesg/
 ├── Movie1.avi
 ├── Movie2.avi
 └── Anime.avi
```

---

## Notes

* Existing AVI files are never overwritten.
* The output directory is created automatically if it doesn't exist.
* Hidden FFmpeg banner for cleaner terminal output.
* Uses all CPU cores automatically.

---

## License

This project is released under the **MIT License**. Feel free to modify, improve, and distribute it.
