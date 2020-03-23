require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save # || @@all << self
    return song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name)
    song = self.create # || self.new
    song.name = song_name
    return song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) # true || false
  end

  def self.alphabetical
    @@all.sort_by do |songs|
      songs.name
    end
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_title = new_file[1].gsub(".mp3","")
    song = self.new
    song.name = song_title
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_title = new_file[1].gsub(".mp3","")
    song = self.new
    song.name = song_title
    song.artist_name = artist_name
    song.save
    return song
  end

  def self.destroy_all
    self.all.clear
  end

end
