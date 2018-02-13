require_relative '../config/environment.rb'
require_relative '../app/model/artist'
require_relative '../app/model/follow'
require_relative '../app/model/user'
require "byebug"

def run

  puts 'Hello. What is your name?'
  name = gets.chomp
  user_info = User.find_or_create_by_name(name)
  puts "What would you like to do today?"
  puts "List:"
  puts "------------"
  puts "1. Search For An Artist"
  puts "2. My Artists"
  puts "3. Search Local Concerts"

end

response = RestClient.get("https://api.seatgeek.com/2/events?venue.state=NY&type=concert&client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3")
hash = JSON.parse(response)

hash["events"][0].each do |k, v|
  if k == ["performers"][0]
    v[0].each do |k2, v2|
      puts v if k == "name"
    end
  end
end



puts "yo"
