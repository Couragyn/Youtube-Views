class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    url = 'https://jon.endpoint.com/youtube-popular-20121222.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)

    entries = json["feed"]["entry"]

    most_viewed = (entries.group_by{|k| k["yt$statistics"]["viewCount"].to_i }.max.last)[0]

    @youtube_video = most_viewed

    @last_updated = (json["feed"]["updated"]["$t"])[0...10]

    # ID is needed for YouTube embed link. Unneeded characters are stripped off
    @id = (most_viewed["id"]["$t"].split(':'))[3]
    
  end
end
