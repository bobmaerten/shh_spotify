# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shh_spotify/version'

Gem::Specification.new do |gem|
  gem.name           = "shh_spotify"
  gem.version        = ShhSpotify::VERSION
  gem.authors        = ["Bob Maerten"]
  gem.email          = ["bob.maerten@gmail.com"]
  gem.description    = %q{Lower Spotify volume for specific tracks.}
  gem.summary        = %q{Lower Spotify (Linux Preview) volume for specific tracks.}
  gem.homepage       = "http://github.com/bobmaerten/shh_spotify"

  gem.add_dependency "ruby-dbus"

  gem.files          = `git ls-files`.split($/)
  gem.executables    = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files     = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths  = ["lib"]
end
