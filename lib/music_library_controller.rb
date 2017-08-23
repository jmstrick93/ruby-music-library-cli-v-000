class MusicLibraryController
  # attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.strip

    while input != 'exit'
      input = gets.strip
    end

  end

  def list_songs
    alpha_array = Song.all.sort{|a,b| a.name.downcase <=> b.name.downcase}

    alpha_array.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    alpha_array = Artist.all.sort{|a,b| a.name.downcase <=> b.name.downcase}

    alpha_array.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    alpha_array = Genre.all.sort{|a,b| a.name.downcase <=> b.name.downcase}

    alpha_array.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    entered_name = gets.strip
    songs = []
    Song.all.each {|song| songs << song if song.artist.name == entered_name}
    songs.sort!{|a,b| a.name.downcase <=> b.name.downcase}
    songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song.name} - #{song.genre.name}"
    end

  end

end
