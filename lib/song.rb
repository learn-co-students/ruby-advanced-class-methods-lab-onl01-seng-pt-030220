

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    @@all<< self
  end
  
  def self.create
  song = self.new
  song.save
  song
  end
  
  def self.new_by_name(name)
  song = Song.new
  song.save
  song.name = name
  song
  end
  
  def self.create_by_name(name)
    song = Song.new
    
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.each do |element|
      return element if element.name == name
    end
    nil
  end 
  
  def self.alphabetical
    
  @@all.sort_by! { |element| element.name }
   
  end
  
  def self.new_from_filename(filename)
    array = filename.split("-")
    song = Song.create_by_name(array[1].split(".")[0].strip())
    song.artist_name=array[0].strip()
    song
  end
  
  def self.find_or_create_by_name(name)
    s = Song.create_by_name(name)
    
    if Song.find_by_name(name) == nil
       return s
        else
       return Song.find_by_name(name)
    end
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    @@all=[]
  end
  
end
