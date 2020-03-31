
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
     song = Song.new 
     song.save 
     return song 
    end 
   
   def self.new_by_name(name)
     song = Song.new 
     song.name= name 
     return song
   end
  
  def self.create_by_name(name)
     song = Song.new 
     song.name= name 
     song.save 
     return song 
   end 
  
  def self.find_by_name(name)
    Song.all.find do |s| 
      s.name == name 
    end
  end 
   
   
   def self.find_or_create_by_name(name)
      song = self.find_by_name(name) 
      if song 
        return song 
      else 
        song = self.create_by_name(name)
        return song 
      end 
    end 
    
    def self.alphabetical 
    @@all.sort_by do |a| 
      a.name 
      end
    end 
  
  
    def self.new_from_filename(fn)
      fn_arr = fn.split(" - ")
	    artist_name = fn_arr.first
	    song_name = fn_arr[1].gsub(".mp3","")
	    song = Song.new
	    song.name= song_name 
	    song.artist_name= artist_name
	    song
    end 
    
    def self.create_from_filename(fn)
       fn_arr = fn.split(" - ")
	    artist_name = fn_arr.first
	    song_name = fn_arr[1].gsub(".mp3","")
	    song = Song.new
	    song.name= song_name 
	    song.artist_name= artist_name
	    song.save
	    song
    end 
    
 
   
   
   
   
   

    
    
  def self.destroy_all 
    @@all.clear
  end 
  
  
  

end
