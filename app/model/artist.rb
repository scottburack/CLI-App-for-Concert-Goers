require 'rest-client'
require 'json'
require 'pry'

class Artist < ActiveRecord::Base
  has_many :follows
  has_many :events
  has_many :users, through: :follows


  def insert_artist_into_url(artist_name)
    url = "https://api.seatgeek.com/2/performers?slug=#{artist_name}&client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3"
  end

  def get_json_from_artist_url(artist_name)
    url = insert_artist_into_url(artist_name)
    response = RestClient.get(url)
    JSON.parse(response)
  end

  def self.find_or_create_by_artist_name(artist_name)
    artist_name = artist_name.downcase
    artist = Artist.find_by(name: artist_name)
    if artist
      artist
    else
      Artist.create(name: artist_name)
    end
  end

  def num_upcoming_events(artist_name)
    hash = get_json_from_artist_url(artist_name)["performers"][0]["num_upcoming_events"]
  end

  def get_json_from_events

  end



  def print_out_shows(artist_name)
    # hash = Artist.new.get_events_by_artist(artist_name)
    puts "This artist has these upcoming shows!"
    puts "--------------------------------------"
    get_events_by_artist(artist_name)
    end



    def get_events_by_artist(artist_name)
      artist = Artist.find_or_create_by_artist_name(artist_name)
      page_number = 1
      events_found = 0
      until events_found == num_upcoming_events(artist_name)
        page = RestClient.get("https://api.seatgeek.com/2/events?performers.slug=#{artist_name}&client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3&page=#{page_number}")
        event_hash = JSON.parse(page)
        event_hash.each do |k,val|
          if k == "events"

              val.each do |k2, val2|
                k2.each do |k3, val3|

                  if k3 == "venue"

                    puts val3["name"]
                    puts val3["display_location"]
                    puts "Date: #{k2["datetime_local"]}"
                    puts "#########################"
                    # byebug
                    events_found +=1
                    if events_found % 10 == 0
                      page_number += 1
                    end
                  end
                end
              end
            end
          end
      end
    end





end
