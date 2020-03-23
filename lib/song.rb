require "pry"
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
    song.save
    song  ## return the song instance
  end
  
  def self.new_by_name(name)
    song_name = self.new  ## not self.new(name)!
    song_name.name = name  ## Here argument comes
    song_name
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name} ## song is instance #<xxxxxxxxx> so need its name
  end
  
  def self.find_or_create_by_name(name2)
    if find_by_name(name2)
      find_by_name(name2)
    else
      create_by_name(name2)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|instance| instance.name}
    ## objects.sort_by {|obj| obj.attribute}
  end
  
  def self.new_from_filename(file_name)
    song_array = file_name.split(" - ")
    artist = song_array[0]
    name = song_array[1].gsub!(".mp3", "")
    
    # song_array = file_name.split(/\s-\s|\.\w/)
    # name = song_array[1]
    # artist_name = song_array[0]
    
    song = self.create  ## self.new is also fine
    song.name = name
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(file_name)
    song_data = new_from_filename(file_name)
    song_data.save
    song_data

  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
