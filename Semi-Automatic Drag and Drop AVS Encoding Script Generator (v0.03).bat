:: Semi-Automatic Drag and Drop AVS Encoding Script Generator (v0.03)
:: This was mainly made for generating encoding scripts for shows with multiple episodes, which would be pretty tedious manually. Its usable currently, but the biggest issues are: 1. This script must be editted manually for every new show (I labelled the ones in caps-lock that I have to edit.); 2. I have no way of retrieving the episode name yet (I'm not a programmer), so that must be added later to the generated script for now.
:: Operating instructions: 1. Adjust this batch file for the current series your encoding. ; 2. Drag an AVS script onto this batch file. Keep doing this for every AVS you have. ; 3. Look at the newly generated script, and make any neccessary changes. ; 4. Run the generated script. You should be done.
@echo off

:: Uses the dragged AVS filename as a variable.
set "dragged_file=%~n1"

mkdir "NAME OF SHOW"

echo :: %dragged_file% >> "NAME OF SHOW (Generated).bat"
echo ffmpeg -i "%dragged_file%.avs" -c:v libx264 -profile:v main -tune animation -preset medium -crf 24 -maxrate 4M -bufsize 8M -movflags +faststart -an "%dragged_file%_VID_TMP.mp4" >> "NAME OF SHOW (Generated).bat"
echo ffmpeg -i "%dragged_file%.avs" -c:a aac -ac 2 -b:a 160k -movflags +faststart -vn "%dragged_file%_AUD_TMP.m4a" >> "Adventure Time (Generated).bat"
echo mp4box -add "%dragged_file%_VID_TMP.mp4":fps=24000/1001 -add "%dragged_file%_AUD_TMP.m4a" -itags title="NAME OF EPISODE (NOT DONE AUTOMATICALLY)":album="NAME OF SHOW":artist="NAME OF PUBLISHER OR NETWORK":created="YEAR OF RELEASE" "%dragged_file%_TMP.mp4" >> "NAME OF SHOW (Generated).bat"
echo move "%dragged_file%_TMP.mp4" "NAME OF SHOW/%dragged_file%.mp4" >> "NAME OF SHOW (Generated).bat"
echo del "%dragged_file%_VID_TMP.mp4" "%dragged_file%_AUD_TMP.m4a" >> "NAME OF SHOW (Generated).bat"

:: New line for next dragged file.
echo. >> "NAME OF SHOW (Generated).bat"
