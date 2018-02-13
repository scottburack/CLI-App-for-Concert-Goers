require 'rest-client'
require 'json'
require 'pry'

class Artist < ActiveRecord::Base
  has_many :follows
  has_many :users, through: :follows

  @@performers_url = "https://api.seatgeek.com/2/performers?slug=&client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3"
  # def hit_api
  #   url = 'https://api.seatgeek.com/2/performers?client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3&page=1'
  #   # response = Net::HTTP.get(url)
  #   response = RestClient.get(url)
  #   JSON.parse(response)
  #   binding.pry
  # end
  def insert_artist_into_url(artist_name)
    url = "https://api.seatgeek.com/2/performers?slug=#{artist_name}&client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3"
  end

  def get_json_from_artist_url(artist_name)
    url = insert_artist_into_url(artist_name)
    response = RestClient.get(url)
    JSON.parse(response)
  end

  def search_by_artist_name(artist_name)

  end

  def has_upcoming_events?(artist_name)
    hash = get_json_from_artist_url(artist_name)["performers"][0]["has_upcoming_events"]
  end






end
