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
    self.all << song
    song
    #binding.pry
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find do |title|
      title.name == name
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
    self.all.sort_by { |object| object.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    file_info = filename.split(" - ")
    song.artist_name = file_info[0]
    title = file_info[1]
    title = title.split(".")
    song.name = title[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    file_info = filename.split(" - ")
    song.artist_name = file_info[0]
    title = file_info[1]
    title = title.split(".")
    song.name = title[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end