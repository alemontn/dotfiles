# Where to get SF Mono / other Apple fonts

### (a) Directly from Apple

1) Go to <https://developer.apple.com/fonts/>

2) Choose which font you want & copy its link

3) Download it

`mkdir ~/Downloads/SF`

`cd ~/Downloads/SF`

`curl -LO <FONT LINK>`

4) Extract it & change to its directory

`7z x <FONT NAME>.dmg`

`cd <FONT NAME>Fonts`

5) Extract the package

`7z x <FONT NAME>.pkg'

`rm -f <FONT NAME>.pkg`

6) Extract the CPIO archive

`gunzip < <FONT NAME>.pkg/Payload | cpio -div'

7) Install the fonts

`cp Library/Fonts/*.otf ~/.local/share/fonts`

### (b) From a repository

SF Mono: <https://github.com/supercomputra/SF-Mono-Font>

SF Pro: <https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts>
