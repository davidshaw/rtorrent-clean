# rtorrent-clean
## Easily remove torrents from unwanted trackers

rtorrent-clean is designed to make it easy for rtorrent users to remove downloads and .torrent files from only certain trackers.

Usage is extremely simple: download the files (parse.py and cleanup.sh) and extract to your home directory (or $PATH). Ensure that the files are marked executable (chmod +x cleanup.sh ; chmod +x parse.py).

rtorrent-clean assumes that rtorrent watch and data directories are their default (~/rtorrent/watch/ and ~/rtorrent/data). If they are NOT default, please edit the first several lines in cleanup.sh so that they point to the correct directories.

## Usage

A good first step is to verify the tracker URLs to which rtorrent is currently connected. This can be accomplished by simply running `./cleanup.sh` (with no args).

Once you have confirmed the tracker URLs, you can remove .torrent files and downloads by running `./cleanup.sh tracker.example.org`. Please wait for several moments for this to complete; you will see removal progress as files are deleted (due to use of rm -rfv).

## Additional steps

After you have removed the .torrent files from the watch directory and the downloads from the data directory, rtorrent will consider these files "stopped" and will not re-download them. They will, however, still show up in rtorrent with `[OPEN]` next to their names. This can be irritating, but it's a problem that is easily solved. Open rtorrent, hit `4` to move to the "stopped torrents" window, and hit `^d` several times until all of the files have been removed from rtorrent.

Happy sharing!
