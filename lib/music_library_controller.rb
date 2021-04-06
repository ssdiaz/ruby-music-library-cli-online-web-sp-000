class MusicLibraryController

  attr_reader :apth, :name, :artist

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
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
        when "list genre"
        when "play song"
      end
    end
  end

  def list_songs
    Song.all.sort{|a,b| a.name<=>b.name}.each_with_index{|song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

  def list_artists
    Artist.all.sort{ |a,b| a.name <=> b.name}.each_with_index{ |artist, index|
      puts "#{index+1}. #{artist.name}"
    }
  end

  def list_genres
    Genre.all.sort{ |a,b| a.name <=> b.name}.each_with_index{ |genre, index|
      puts "#{index+1}. #{genre.name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp

    if artist = Artist.find_by_name(input)
      artist.songs.sort {|a,b| a.name <=> b.name}.each_with_index{|song, index|
        puts "#{index+1}. #{song.name} - #{genre.name}"
      }
    end
  end

end
# rspec spec/010_music_library_controller_spec.rb
# rspec spec/011_music_library_cli_methods_spec.rb
#./bin/musiclibrary
