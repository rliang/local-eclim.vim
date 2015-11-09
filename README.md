# local-eclim.vim
Provides a vim-wide installation of Eclipse+Eclim.

## Summary
This plugin comes with an install script that attempts to detect the underlying
OS, download the appropriate Eclipse (JDT) bundle and the Eclim jar, and
install it within its directory.

## Setup
With vim-plug:
```vim
Plug 'rliang/local-eclim.vim' {'do': './install.sh', 'for': 'java'}
```

## Dependencies
The install script needs the following programs:
* `bash`
* `uname`
* `which`
* `curl` or 'wget'
* `md5sum`
* `tar` (Unix) or 'unzip' (Windows)

Not yet tested on Windows or OS X; contributions welcome.

## Commands
* `:StartEclim`: starts the Eclim daemon.

## Credits
Inspired by the <https://github.com/starcraftman/vim-eclim> plugin, with some
initialization code borrowed from it.
