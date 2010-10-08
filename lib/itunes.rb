# -*- coding: utf-8 -*-
#
# itunes.rb
#
# iTunesを制御するITunesクラス (Mac用)
#  内部でAppleScriptを使用している
#
class ITunes
  def initialize
    `osascript -e 'tell application "iTunes" to launch'`
  end

  # 再生
  def play(no_or_name = "")
    if no_or_name.class == Fixnum
      no_or_name = "track #{no_or_name}"
    elsif no_or_name != ""
      no_or_name = "track \"#{no_or_name}\""
    end
    `osascript -e 'tell application "iTunes"' -e 'play #{no_or_name}' -e 'end tell'`
  end
 
  # プレイリスト再生
  def playlist_play(no_or_name = 1, shuffle = false)
    no_or_name = "\"#{no_or_name}\"" if no_or_name.class == String
    `osascript -e 'tell application "iTunes"' -e 'set shuffle of playlist #{no_or_name} to #{shuffle}' -e 'play playlist #{no_or_name}' -e 'end tell'`
  end

  # シャッフル再生
  def shuffle_play(no_or_name = 1)
    playlist_play(no_or_name, true)
  end

  # 停止
  def stop
    `osascript -e 'tell application "iTunes"' -e 'stop' -e 'end tell'`
  end

  # 一時停止
  def pause
    `osascript -e 'tell application "iTunes"' -e 'pause' -e 'end tell'`
  end

  # 一時停止／再生（シャッフルだと再生されない？）
  def playpause
    `osascript -e 'tell application "iTunes"' -e 'playpause' -e 'end tell'`
  end

  # 次の曲へ
  def next
    `osascript -e 'tell application "iTunes"' -e 'next track' -e 'end tell'`
  end

  # 前の曲へ
  def previous
    `osascript -e 'tell application "iTunes"' -e 'previous track' -e 'end tell'`
  end

  # 曲の先頭または前の曲へ
  def back
    `osascript -e 'tell application "iTunes"' -e 'back track' -e 'end tell'`
  end

  # 早送り
  def forward
    `osascript -e 'tell application "iTunes"' -e 'fast forward' -e 'end tell'`
  end

  # 巻き戻し
  def rewind
    `osascript -e 'tell application "iTunes"' -e 'rewind' -e 'end tell'`
  end

  # 早送り/巻き戻しから復帰
  def resume
    `osascript -e 'tell application "iTunes"' -e 'resume' -e 'end tell'`
  end

  # 曲名を取得
  def name
    `osascript -e 'tell application "iTunes"' -e 'set trackName to name of current track' -e 'return trackName' -e 'end tell'`.chop
  end

  # アーティスト名を取得
  def artist
    `osascript -e 'tell application "iTunes"' -e 'set trackArtist to artist of current track' -e 'return trackArtist' -e 'end tell'`.chop
  end

  # アルバム名を取得
  def album
    `osascript -e 'tell application "iTunes"' -e 'set trackAlbum to album of current track' -e 'return trackAlbum' -e 'end tell'`.chop
  end

  # プレイリスト名を取得
  def playlist
    `osascript -e 'tell application "iTunes"' -e 'set playlistName to name of current playlist' -e 'return playlistName' -e 'end tell'`.chop
  end
end
