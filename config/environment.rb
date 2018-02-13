require 'bundler'
Bundler.require
require 'active_record'
require_relative '../app/model/artist.rb'
require_relative '../app/model/follow.rb'
require_relative '../app/model/user.rb'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all 'lib'
