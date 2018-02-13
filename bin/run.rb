require_relative '../config/environment.rb'
require_relative '../app/model/artist'
require_relative '../app/model/follow'
require_relative '../app/model/user'

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

run
