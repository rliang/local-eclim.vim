# local-eclim.vim
Provides a vim-wide installation of Eclipse JDT+Eclim.

## Summary
This plugin comes with an Ant build script that detects the underlying OS,
fetches the appropriate Eclipse bundle and the Eclim jar, and installs it
within its directory.

Not yet tested on Windows or OS X; contributions welcome.

## Dependencies
* `ant`

## Setup
With vim-plug:
```vim
Plug 'rliang/local-eclim.vim' {'do': 'ant', 'for': 'java'}
```

## Commands
* `:StartEclim`: starts the Eclim daemon.

## Credits
Inspired by <https://github.com/starcraftman/vim-eclim>, with some
initialization code borrowed from it.
