module NumOfUpcomingShows
def num_upcoming_events(artist_name)
  hash = get_json_from_artist_url(artist_name)["performers"][0]["num_upcoming_events"]
end

end
