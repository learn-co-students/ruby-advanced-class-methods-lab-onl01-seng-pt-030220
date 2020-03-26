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

end
