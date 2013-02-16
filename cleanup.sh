#!/bin/bash

############ IMPORTANT ###########
# change these directories if you
# aren't using standard ones for
# rtorrent. thanks!
WATCH_DIR=$HOME/'rtorrent/watch'
DATA_DIR=$HOME/'rtorrent/data'
##################################

if [ $# -eq 0 ]; then
	echo "[!] No tracker detected. Possible trackers include:"
	for f in "$WATCH_DIR"/* ; do python parse.py "$f" ; done | cut -d'|' -f3 | sort | uniq
	exit
fi

echo "[+] Searching for files matching $1"
for f in "$WATCH_DIR"/* ; do python parse.py "$f" ; done | grep $1 | cut -d'|' -f2 > files.txt

echo "[+] Searching for matching files/directories..."
for f in "$WATCH_DIR"/* ; do python parse.py "$f" ; done | grep $1 | cut -d'|' -f1 | sed -e "s#^#$DATA_DIR\/#g" >> files.txt

echo "[+] Removing files matching $1"
while read f; do rm -rfv "$f" ; done < files.txt
rm files.txt
# done!

