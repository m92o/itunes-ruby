# -*- coding: utf-8 -*-
#
# itunes.rb
#
# iTunesを制御するITunesクラス (Mac用)
#  内部でAppleScriptを使用している
#
class ITunes
  def initialize
    str = `osascript -e 'tell application "iTunes" to launch'`
  end

  # 再生
  def play
    str = `osascript -e 'tell application "iTunes"' -e 'play' -e 'end tell'`
  end

  # 停止
  def stop
    str = `osascript -e 'tell application "iTunes"' -e 'stop' -e 'end tell'`
  end

  # 一時停止／再生
  def playpause
    str = `osascript -e 'tell application "iTunes"' -e 'playpause' -e 'end tell'`
  end

  # 次の曲へ
  def next
    str = `osascript -e 'tell application "iTunes"' -e 'next track' -e 'end tell'`
  end

  # 前の曲へ
  def previous
    str = `osascript -e 'tell application "iTunes"' -e 'previous track' -e 'end tell'`
  end

  # 曲名を取得
  def name
    str = `osascript -e 'tell application "iTunes"' -e 'set trackName to name of current track' -e 'return trackName' -e 'end tell'`
    (str != "") ? str.chop : nil
  end

  # アーティスト名を取得
  def artist
    str = `osascript -e 'tell application "iTunes"' -e 'set trackArtist to artist of current track' -e 'return trackArtist' -e 'end tell'`
    (str != "") ? str.chop : nil
  end

  # アルバム名を取得
  def album
    str = `osascript -e 'tell application "iTunes"' -e 'set trackAlbum to album of current track' -e 'return trackAlbum' -e 'end tell'`
    (str != "") ? str.chop : nil
  end
end
