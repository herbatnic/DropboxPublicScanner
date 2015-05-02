# DropboxPublicScanner
Shell script allowing scanning public folder of Dropbox. It finds and downloads localy any file with the name given in types.txt from Dropbox public folders of users with give ID range. 

This is the newer version of script which I written in 2011 (I suppose). Currently it supports Dropbox ID range to scan. Also usage section was added and some hardcoded parts was resolved.

## Usage
Run the script with two parameters Start Dropbox Id and End Dropbox Id

`./DropboxPublicScaner.sh 10000 11000`

It will scan public dropbox folder and look for files enlisted in types.txt

## Example
Result (after some time) of the code above gives three found files:

  [h@localhost DropboxPublicScanner]$ ls -al /media/sf_LE/10*
  -rwxrwx---. 1 root vboxsf   550 05-02 08:10 /media/sf_LE/10X47_index.html
  -rwxrwx---. 1 root vboxsf    20 05-02 08:58 /media/sf_LE/10X12_test.txt
  -rwxrwx---. 1 root vboxsf 44088 05-02 08:54 /media/sf_LE/10X30_me.jpg

## Misc

### Running wget section

  h        11445  0.0  0.2 155752  7188 pts/0    S    08:16   0:00 wget -q --tries=2 --timeout=30 --limit-rate=20k http://dl.dropbox.com/u/10142/1.rar
  h        11446  0.0  0.2 155884  7016 pts/0    S    08:16   0:00 wget -q --tries=2 --timeout=30 --limit-rate=20k http://dl.dropbox.com/u/10166/autorun.inf
  h        11448  0.0  0.2 155752  7252 pts/0    S    08:16   0:00 wget -q --tries=2 --timeout=30 --limit-rate=20k http://dl.dropbox.com/u/10241/me1.jpg
  h        11449  0.1  0.2 155884  7024 pts/0    S    08:16   0:00 wget -q --tries=2 --timeout=30 --limit-rate=20k http://dl.dropbox.com/u/10159/new%20file
  h        11450  0.0  0.2 155884  6916 pts/0    S    08:16   0:00 wget -q --tries=2 --timeout=30 --limit-rate=20k http://dl.dropbox.com/u/10143/New%20Microsoft%20Office%20Excel%20Worksheet.xlsx
  h        11451  0.0  0.1 154552  4948 pts/0    S    08:16   0:00 wget -q --tries=2 --timeout=30 --limit-rate=20k http://dl.dropbox.com/u/10162/my.jpg
