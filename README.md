# shh\_spotify

Lowers the Spotify application volume when a specific track is played.
Tracks to be watched are stored in the `~/.shh_spotify.watchlist` file.
The watchfile will be eventually created.

Tested only for the moment on Ubuntu 12.04LTS with ruby1.9.3 installed via [rbenv](https://github.com/sstephenson/rbenv).

## Pre-requisites
  - ruby with rubygems (aptitude install ruby rubygems)
  - dbus (native on linux)
  - pulseaudio (native on Ubuntu 12.04)

## Installation

Install as usual ruby gems:

    $ gem install shh_spotify

## Usage

Start Spotify, then open a console and type:

    $ ssh_spotify

Press 'q' to quit, or 'p' to insert current track in watchlist file.
The current track's volume is automaticaly lowered.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
