require "set"

module ShhSpotify
  WATCHLIST = "#{ENV['HOME']}/.shh_spotify.watchlist"

  class Watchlist
    def initialize
      self.load
    end

    def load
      @watch = Set.new
      begin
        File.open(WATCHLIST, 'r') do |infile|
          while (line = infile.gets)
            @watch << line.chomp
          end
        end
      rescue
        File.open(WATCHLIST, 'w')
      end
    end

    def add(string)
      File.open(WATCHLIST, 'a') do |outfile|
        outfile.puts string
      end
      @watch << string
    end

    def include?(string)
      @watch.include? string
    end

    def list
      @watch.each do |track|
        puts track
      end
    end
  end
end
