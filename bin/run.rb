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

# def print_out_shows
#
#   hash = Artist.new.get_events_by_artist("eminem")
#   puts "This artist has these upcoming shows!"
#   puts "--------------------------------------"
#   hash.each do |k,val|
#     # byebug
#     if k == "events"
#     val.each do |k2, val2|
#       k2.each do |k3, val3|
#         if k3 == "venue"
#
#           puts val3["name"]
#
#         end
#       end
#
#     end
#   end
#
#
#   end
