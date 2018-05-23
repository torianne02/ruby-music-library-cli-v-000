class MusicLibraryController
  def initialize(path = "./db/mp3s")
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
    until input == "exit"
      input = gets.chomp
      case input
      when "list songs"
        list_songs
      when "list artitst"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    songs = Song.all.sort_by! {|song| song.name}
    songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    artists = Artist.all.sort_by! {|artist| artist.name}
    artists.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end
end
