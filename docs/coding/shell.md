Sharing useful terminal commands and combinations to do things

# Convert samples to RAW format

Issue: Axoloti platform can understand samples, but only in RAW format. Need to find a way to convert to this.

Solutiuon: At first I tried audacity, Though it works well, but not for several files in a row; so i investigated terminal possibilities. ChatGPT helped me to compose the command. Written below converts all WAV files in current directory.

for i in *.wav; do
    ffmpeg -i "$i" -f s16le -acodec pcm_s16le "${i%.*}.raw"
done
