class Song
  attr_accessor :name, :artist_name
  @@all =[]


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
   def self.new_by_name(name)
       song = self.new
       song.name=name
       song
   end

   def self.create_by_name(name)
     song = self.new
     song.name=name
     song.save
     song
   end
   def self.find_by_name(name)
      @@all.find do |song|
        song.name == name
      end
   end

   def self.find_or_create_by_name(name)

    if self.find_by_name(name)
        @@all[0]
    else
      self.create_by_name(name)
    end

   end

   def self.alphabetical
      @@all.sort_by { |word|
          word.name
        }
   end
   def self.new_from_filename(filename)
       str=  filename.split('-')
       artist_name =str[0].strip
       name=str[1].chomp(".mp3").strip
       song = self.new
       song.name=name
       song.artist_name=artist_name
       song
   end

  def self.create_from_filename(filename)
         self.new_from_filename(filename).save

  end
   def self.destroy_all
     self.all.clear     
   end

end
