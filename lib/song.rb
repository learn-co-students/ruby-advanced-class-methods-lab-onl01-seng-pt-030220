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
  @@song = self.new 
  @@song.save
  @@song
  end

  def self.new_by_name(name)
    song_name = self.new
    song_name.name = name 
    @@song_name = song_name
  end

  def self.new_artist_name(name)
    artist_name = self.new 
    artist_name.name = name 
    @@artist_name = artist_name
  end


  def self.create_by_name(name) 
    create_name = self.new 
    create_name.name = name 
    @@create_name = create_name
    @@create_name.save 
    @@create_name
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)  
      return find_by_name(name)  
    else
      create_by_name(name)
    end
    # binding.pry
  end

  def self.find_by_name(name)
    @@all.each do |a|
        if a.name == name 
          return a 
        else 
        end
      end
      nil 
  end

  def self.alphabetical 
    @@all.sort_by{|a| a.name}
  end


def self.new_from_filename(filename)
  array = filename.split(/ - |.mp3/)
  array.map do |a|
    a.split(" ")
  end
  new_artist_name = array[0]
  name = array[1]
  song = new_by_name(name)  
  song.artist_name = new_artist_name
  song 
end

def self.create_from_filename(abc)
  array = abc.split(/ - |.mp3/)
  array.map do |a| 
    a.split(" ")
  end
  new_artist_name = array[0]
  name = array[1]
  song = create_by_name(name)  
  song.artist_name = new_artist_name
  song 
end

def self.destroy_all 
  @@all.clear 
end

end
