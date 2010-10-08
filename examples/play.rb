# -*- coding: utf-8 -*-
#
# play.rb
#
require 'itunes'

itunes = ITunes.new
itunes.shuffle_play
puts "#{itunes.name} / #{itunes.artist} (#{itunes.playlist})"
