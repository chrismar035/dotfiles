mov2gif () {
	ffmpeg -i $1 -vf "fps=10,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 screen.gif
}

mov2gif720p () {
	ffmpeg -i $1 -vf "fps=10,scale=720:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 screen.gif
}

mov2webp () {
  ffmpeg -i $1 \
    -vf "fps=10,scale=720:-1:flags=lanczos" \
    -vcodec libwebp -lossless 0 -compression_level 6 \
    -q:v 50 -loop 0 \
    -preset picture -an -vsync 0 screen.webp
}
