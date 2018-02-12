require 'rest-client'
require 'json'
require 'pry'
class Artist < ActiveRecord::Base
  has_many :follows
  has_many :users, through: :follows


  def hit_api
    url = 'https://api.seatgeek.com/2/performers?client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3&page=1'
    # response = Net::HTTP.get(url)
    response = RestClient.get(url)
    JSON.parse(response)
  end



end
