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
    self.all << song
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name) 
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |e| e.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    song_array = file_name.split(/[\-|\.]/)
    song.artist_name = song_array[0].strip()
    song.name = song_array[1].strip()
    song
  end

  def self.create_from_filename(mp3)
    @@all << self.new_from_filename(mp3)
  end

  def self.destroy_all
    self.all.clear
  end

end

