class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end

def self.new_by_name(song_name)
  song = self.new 
    song.name = song_name
    song.save 
    song
end   

def self.create_by_name (song_name)
  song = self.new
    song.name = song_name
    song.save
    song
  end
  
 def self.find_by_name(song_name)
    Song.all.find {|a_song| a_song.name == song_name}
  end

  def self.find_or_create_by_name(this_song)
    find_by_name(this_song) || create_by_name(this_song)
  end
    
  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 

def self.new_from_filename(song_name)
    parts = song_name.split(" - ")
    artist = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.artist_name = artist
    song.name = song_name
    song
  end

  def self.create_from_filename(song_name)
    song = new_from_filename(song_name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end