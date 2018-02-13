require_relative '../config/environment.rb'


def run

  puts "What is your full name?"

  input = gets.chomp

  User.find_or_create_by_name(input)



end

run
