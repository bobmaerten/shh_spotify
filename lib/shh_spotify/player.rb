require "dbus"

module ShhSpotify
  class Player
    def initialize
      # Get the dbus session
      dbus = DBus::SessionBus.instance
      abort("Spotify is not currently running.") unless dbus.proxy.ListNames[0].include? "org.mpris.MediaPlayer2.spotify"

      # Get the Spotify service
      @spotify = dbus.service("org.mpris.MediaPlayer2.spotify").object("/org/mpris/MediaPlayer2")

      # Introspect it
      @spotify.introspect
      if @spotify.has_iface? "org.mpris.MediaPlayer2.Player"
        @player = @spotify["org.mpris.MediaPlayer2.Player"]
      end

      if @spotify.has_iface? "org.freedesktop.DBus.Properties"
        @properties = @spotify["org.freedesktop.DBus.Properties"]
      end
    end

    def status
      @properties.Get("org.mpris.MediaPlayer2.Player", "PlaybackStatus").first
    end

    def playing
      "#{self.artist} - #{self.title}"
    end

    def paused?
      status == "Paused"
    end

    def resume
      @player.PlayPause
    end

    def player
      @player
    end

    def still_running?
      @spotify.has_iface? "org.mpris.MediaPlayer2.Player"
    end

    def check?
      abort("Spotify is not running anymore, quitting") unless self.still_running?
    end

    def artist
      begin
        @player["Metadata"]["xesam:artist"].first
      rescue
        ""
      end
    end

    def title
      begin
        @player["Metadata"]["xesam:title"]
      rescue
        ""
      end
    end
  end
end
