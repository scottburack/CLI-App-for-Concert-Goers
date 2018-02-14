
class User < ActiveRecord::Base

  has_many :follows
  has_many :artists, through: :follows



  def self.find_or_create_by_name(name)
    user = User.find_by(name: name)
    if user
      puts "Welcome back, #{user.name}!"
      user
    else
      User.create(name: name)
      puts "Hello, #{name}! We're happy you joined us!"
      user
    end
  end



  def follow_artist(artist_name)
    artist_name = artist_name.downcase
    artist = Artist.find_or_create_by_artist_name(artist_name)
    if self.artists_array.include?(artist_name)
      puts "You've already added this artist!"
    else
      Follow.create(user_id: self.id, artist_id: artist.id)
    end
  end



  def show_own_artists
    puts "The artists you currently follow are:"
    puts "--------------------------------------"
    self.artists.each do |artist|
      puts artist.name.capitalize
      ""
  end
end

def artists_array
  array = []
  self.artists.each do |artist|
    array << artist.name
  end
  array.uniq
end

def search_for_concerts_by_area(location)
  Event.where(location: location)

end

def put_out_concerts_by_area(location)
  puts "--------------------------------------------------------------"
  puts "Here are the artists you follow that are playing in this area:"
  puts "--------------------------------------------------------------"
  search_for_concerts_by_area(location).each do |event|

    puts "#{Artist.find_by(id: event.artist_id).name.capitalize}"
    puts "#{event.name.capitalize}"
    puts "#{event.location}"
    puts "Date: #{event.date}"
    puts "###################################"
  end
  return nil
end


end
