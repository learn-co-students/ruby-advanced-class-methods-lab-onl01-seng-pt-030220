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
    newly_created_song = Song.new
    newly_created_song.save
    newly_created_song
  end

  def self.new_by_name(name_string)
    newly_created_song = Song.new
    newly_created_song.name = name_string
    newly_created_song
  end

  def self.create_by_name(name_string)
    newly_created_song = Song.new
    newly_created_song.name = name_string
    newly_created_song.save
    newly_created_song
  end

  def self.find_by_name(name_string)
    array = @@all
    array.find do |iteration|
      iteration.name == name_string
    end
  end

  def self.find_or_create_by_name(name_string) #you should rewrite this cuz it's ...ugly
    if self.find_by_name(name_string) == nil
      return self.create_by_name(name_string)
    else
      return self.find_by_name(name_string)
    end
  end

  def self.alphabetical
    array = self.all
    array.sort do |song_element_1, song_element_2|
      song_element_1.name <=> song_element_2.name
    end
  end

  def self.new_from_filename

  end

  def self.create_fro_filename

  end

  def self.destroy_all
    @@all.clear
  end

end #SONGclassEND
