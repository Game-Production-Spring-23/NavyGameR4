20240414-2014 John Blue notes on getting audio leveled and organized for the Godot framework.
* Note: Linux Ubuntu 22.04 server used for
* sed and other linux command line tools to manipulate text files.
** ffmpeg (ffmpeg version 6.1-1build2~22.04) and ffmpeg normalize are used. 
sudo apt install python3-pip
pip3 install ffmpeg-normalize

* Also, a Google sheet is used to help organize the information.
** https://docs.google.com/spreadsheets/d/1Kt7aNEo741WJrgbBVtfmgUnZPY-Lzzjvfr35Vc_S97w

* The main script was used to proof audio and use as guide on game flow QA.
** Word on IU OneDrive https://bit.ly/4cTngtd
** Copy placed in GitHub readme folder
----------------------------------------------------------------------
1) input script text pulled from main script in word => output script text with tabs removed (sed -e 's/^[ \t]*//g'), excess white space (sed 's/[[:space:]]\{2,\}/ /g'), and blank lines (sed  '/^$/d'), replace colon and open double quote with bar (sed 's/\: \“/\|/g'), remove closing double quotes (sed 's/\”//g'), put into new file with line numbers and bar delimiter

cat Area-3-Mt.-Tenanan.txt|sed -e 's/^[ \t]*//g'|sed 's/[[:space:]]\{2,\}/ /g'|sed  '/^$/d'  |sed 's/\: \“/\|/g'|sed 's/\”//g'|nl -w2 -s'|'>Area-3-Mt.-Tenanan-out.txt


1.1) import new file into worksheet with bar as delimiter

2) Get characters organized ord number and character order
2.1) get RangerFemale  and RangerMale lines setup

3) Open aup files and get set for multiple export (command B segments of audio as setup)

4) Sort work sheet to get all the character lines in one spot and sorted. Sorted by character then character order helps.

5) Proof the character lines with the character's audio file.

6) export audio as multiple files to .wav files

7) run ffmpeg-normalize *.wav -ext wav -t -20

8) proof the files are in normalized folder. Import a character set of wav files into Audacity to check level with a master aup file.

9) run 
=> for i in $(ls | grep wav); do /usr/bin/make-ogg.sh $i; done
Note: make-ogg.sh script defined at bottom of this file.

10) fix names from .wav.ogg to .ogg with file rename

11) copy a chapter main.dialogue file to dialog prep folder, rename add to it area id.

12) in the dialog prep folder run the following

cat area3-main.dialogue|sed -e 's/^[ \t]*//g'|sed 's/[[:space:]]\{2,\}/ /g'|sed -n 's/.*\(\[ID\:.*\]\).*/\1\|\0/p'> area3-prep.csv

13) import the csv and align with the main script info in worksheet
14) pull out into batches organized by character the copy of name ogg to tag ogg named files.
15) commit to github by character. stay consistent
16) Clean up ogg files by putting in pushed folder
17) If there is an issue, always start with aup file => to wav => normalize => convert to ogg => push

======================================================================

a bash script to process multiple audio files 
location 
/usr/bin/make-ogg.sh
----------------------------------------------------------------------
#! /bin/bash
echo make $1 an ogg
ffmpeg -i $1  -acodec libvorbis $1.ogg
----------------------------------------------------------------------

and it used in this form to transform wav files shown above
for i in $(ls | grep wav); do /usr/bin/make-ogg.sh $i; done