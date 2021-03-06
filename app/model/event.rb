class Event < ActiveRecord::Base

  belongs_to :artist


  def insert_artist_into_url(artist_name)
    url = "https://api.seatgeek.com/2/performers?slug=#{artist_name}&client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3"
  end

  def self.search_for_concerts_by_area(location)
    Event.where(location: location)
  end


  def get_json_from_artist_url(artist_name)
    url = insert_artist_into_url(artist_name)
    response = RestClient.get(url)
    JSON.parse(response)
  end

  # def num_upcoming_events(artist_name)
  #   hash = get_json_from_artist_url(artist_name)["performers"][0]["num_upcoming_events"]
  # end

  def self.add_events_by_artist(artist_name)
    artist_url_name = artist_name.downcase.split(" ").join("-")
    # byebug
    artist = Artist.find_or_create_by(name: artist_name)
    page_number = 1
    events_found = 0
    until events_found == artist.num_upcoming_events(artist_url_name)
      page = RestClient.get("https://api.seatgeek.com/2/events?performers.slug=#{artist_url_name}&client_id=MTI5NzcxN3wxNTE4NDY4MTUzLjk3&page=#{page_number}")
      event_hash = JSON.parse(page)

      event_hash.each do |k,val|
        if k == "events"

            val.each do |k2, val2|
              k2.each do |k3, val3|

                if k3 == "venue"
                  name = val3["name"]
                  location =  val3["display_location"]
                  date =  k2["datetime_local"]
                  Event.find_or_create_by(name: name, location: location, date: date, artist_id: artist.id)
                  events_found +=1
                  # byebug
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
