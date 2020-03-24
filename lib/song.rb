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
    @@all << song
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
  
  def self.find_by_name(song)
    @@all.find do |item|
      item.name == song
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
  end
  end
  
  def self.alphabetical
    #sorted_array = []
    @@all.sort_by do |item|
      item.name
    end
  end
  
  def self.new_from_filename(mp3file)
    new_song = self.new
    new_song_array = mp3file.split(/[\-|\.]/)
    new_song.name = new_song_array[1].strip()
    new_song.artist_name = new_song_array[0].strip()
    new_song
    #binding.pry
  end
  
  def self.create_from_filename(mp3file)
     @@all<< self.new_from_filename(mp3file)
    
  end
  
  
  def self.destroy_all
    @@all.clear
  end
end


Song.new_from_filename("Taylor Swift - Blank Space.mp3")

