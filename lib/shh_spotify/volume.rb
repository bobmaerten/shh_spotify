module ShhSpotify
  LOW_VOLUME = 10
  SPOTIFY_APP = 'spotify'

  class Volume
    def initialize
      @volume = 0
    end

    def lower_volume
      @volume = get_app_volume
      set_app_volume LOW_VOLUME
    end

    def restore_volume
      set_app_volume @volume
    end

    private
    def get_app_sink_input
      `pacmd list-sink-inputs | grep -B30 #{SPOTIFY_APP} | grep index | awk '{print $2}'`.chop;
    end

    def set_sink_volume(sink, volume)
      `pactl set-sink-input-volume #{sink} #{volume}%`
    end

    def get_app_volume
      `pacmd list-sink-inputs | grep -B30 #{SPOTIFY_APP} | grep volume | awk '{print $3}'`.chop.chomp("%").to_i
    end

    def set_app_volume(volume)
      set_sink_volume(get_app_sink_input, volume)
    end

  end


end
