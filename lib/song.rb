require 'pry'

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
    song=Song.new
    @@all << song
    song
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
    @@all.find do |x|
      x.name==name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)==nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end

  end

  def self.alphabetical
      self.all.sort_by{|song| song.name }

  end

  def self.new_from_filename(filename)
    song=Song.new
    split_file_name=filename.split('-')
    song.artist_name= split_file_name[0].chomp(' ')
    song.name=split_file_name[1].chomp('.mp3')
    song.name[0]=''
    song

  end

  def self.create_from_filename(filename)
    song=Song.new
    split_file_name=filename.split('-')
    song.artist_name= split_file_name[0].chomp(' ')
    song.name=split_file_name[1].chomp('.mp3')
    song.name[0]=''
    @@all << song

  end


  def self.destroy_all
    @@all.clear

  end




end
