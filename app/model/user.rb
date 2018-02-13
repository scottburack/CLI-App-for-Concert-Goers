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
    artist = Artist.find_or_create_by_artist_name(artist_name)
    Follow.create(user_id: self.id, artist_id: artist.id)
  end



  def show_own_artists
    puts "The artists you currently follow are:"
    puts "--------------------------------------"
    self.artists.each do |artist|
      puts artist.name.capitalize
  end
end

def search_by_area
  
end





end
