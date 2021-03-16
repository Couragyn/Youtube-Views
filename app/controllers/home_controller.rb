class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    highestCount = 0
    highestEntry = 0

    url = 'https://jon.endpoint.com/youtube-popular-20121222.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)

    entries = json["feed"]["entry"]

    entries.each_with_index do |entry, i|
        if (thisEntryViews = entry["yt$statistics"]["viewCount"].to_i) > highestCount
            highestCount = thisEntryViews
            highestEntry = i
        end 
    end

    @youtube_video = entries[highestEntry]

    @last_updated = (json["feed"]["updated"]["$t"])[0...10]

    # ID is needed for YouTube embed link. Unneeded characters are stripped off
    @id = (entries[highestEntry]["id"]["$t"].split(':'))[3]
  end
end
