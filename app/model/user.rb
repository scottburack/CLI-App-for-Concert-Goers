
class User < ActiveRecord::Base

  has_many :follows
  has_many :artists, through: :follows



  def self.find_or_create_by_name(name)
    user = User.find_by(name: name)
    if user
      puts "Hello, #{user.name}!"
      user
    else
      User.create(name: name)
      puts "Welcome, #{name}!"
      user
    end
  end



  def add_artist(artist_name)
    artist_name = artist_name.downcase
    # artist = Artist.find_or_create_by_artist_name(artist_name)
    artist = Artist.find_by(name: artist_name)
    Follow.create(user_id: self.id, artist_id: artist.id)
    Event.add_events_by_artist(artist_name)
  end



  def show_own_artists
    puts "The artists you currently follow are:"
    puts "--------------------------------------"
    self.artists.each do |artist|
      puts artist.name.capitalize
  end
  return ""
end

def artists_array
  array = []
  self.artists.each do |artist|
    array << artist.name
  end
  array.uniq
end




end



# def search_for_shows_by_area
#   artists_array.each do |artist_name|
#     # byebug
#     Artist.get_events_by_artist(artist_name)
#
#   end
# end
