class MusicLibraryController

  attr_accessor :path, :object, :name

  def initialize(path= "./db/mp3s")
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

    input = ""
    while input != "exit"
      input = gets.chomp

      case input
        when "list songs"

        when "list artists"
        when "list genres"
        when "list artist"
        when "list genre"
        when "play song"
      end
    end
  end

  def list_songs

    # array = Song.all.sort do |a,b| a<=> b end
    # array.each_with_index {|song, index|
    # Song.all.each_with_index.sort {|song, index|
    Song.all.sort{|a.name,b.name| a<=>b}.each_with_index {|song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

end
# rspec spec/010_music_library_controller_spec.rb
# rspec spec/011_music_library_cli_methods_spec.rb
#./bin/musiclibrary
