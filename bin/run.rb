require_relative '../config/environment.rb'
require_relative '../app/model/artist'
require_relative '../app/model/follow'
require_relative '../app/model/user'
require_relative '../app/model/event'
require "byebug"

def run

  puts 'Hello. What is your name?'
  name = gets.chomp
  user_info = User.find_or_create_by_name(name)
  puts "What would you like to do today?"
  puts "List:"
  puts "-------------------------"
  puts "1. Search For An Artist"#Complete
  puts "2. My Artists"#Complete
  puts "3. Search Local Concerts"
  puts "4. Follow Artist"#Complete
  puts "5. Search Concerts By City"
  puts "6. Exit"
  answer = gets.chomp


end
