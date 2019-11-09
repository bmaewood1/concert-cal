require 'bundler'
Bundler.require


require 'byebug'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')

json = JSON.parse(RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&marketId=35&apikey=9Gi3bYz1RDWYyebA5yy6setBUgOQPG12')


event_hash = {
    artist: nil,
    venue: nil,
    date: nil
}

json["_embedded"]["events"].each do |main|
    event_hash[:artist] = main["name"]
    event_hash[:venue] = main["_embedded"]["venues"].first["name"]
    event_hash[:date] = main["dates"]["start"]["localDate"])
    byebug
end




