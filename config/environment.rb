require 'bundler'
Bundler.require
require_relative '../app/model/artist'
require_relative '../app/model/follow'
require_relative '../app/model/user'
require_relative '../app/model/event'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil
