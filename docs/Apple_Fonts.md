# Where to get SF Mono / other Apple fonts

### (1) Directly from Apple

1) Go to <https://developer.apple.com/fonts/>

2) Choose which font you want & copy its link

3) Download it

`mkdir ~/Downloads/SF`

`cd ~/Downloads/SF`

`curl -LO <FONT LINK>`

4) Extract it & change to its directory

`7z x <FONT NAME>.dmg`

`cd <FONT NAME>Fonts`

5) Extract the CPIO archive

`cpio -div < Payload`

6) Install the fonts

`cp Library/Fonts/*.otf ~/.local/share/fonts`

### (2) From a repository

SF Mono: <https://github.com/supercomputra/SF-Mono-Font>

SF Pro: <https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts>
