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

def test1

  hash = Artist.new.get_events_by_artist("eminem")

  hash.each do |k,val|
    val.each do |k2|
      k2.each do |k3|
        byebug
      end
    end
  end

end

test1
