class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name=(name_of_song)
    song
  end
  
  def self.create_by_name(name_of_song)
    song = self.create
    song.name=(name_of_song)
    song
  end 
  
  def self.find_by_name(name_of_song)
    @@all.find do |song|
      song.name == name_of_song
    end
  end 
  
  def self.find_or_create_by_name(name_of_song)
    song = self.find_by_name(name_of_song)
      if song
        return song
      else
        return self.create_by_name(name_of_song)
    end 
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end 
  end
  
  def self.new_from_filename(file)
    file_parts = file.split(" - ")
    song_name_mp = file_parts[1].split(".")
    song_name = song_name_mp[0]
    artist_name = file_parts[0]
    new_song = self.new
    new_song.name=(song_name)
    new_song.artist_name=(artist_name)
    new_song
    end 
  
  def self.create_from_filename(file)
    file_parts = file.split(" - ")
    song_name_mp = file_parts[1].split(".")
    song_name = song_name_mp[0]
    artist_name = file_parts[0]
    new_song = self.create_by_name(new_song)
    new_song.name=(song_name)
    new_song.artist_name=(artist_name)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end











