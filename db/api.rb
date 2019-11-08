require 'bundler'
Bundler.require
require_all "app"
require 'byebug'
require "action_cable/engine"


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')

json = JSON.parse(RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&marketId=35&apikey=9Gi3bYz1RDWYyebA5yy6setBUgOQPG12')


json["_embedded"]["events"].each do |main|
    Event.create(artist: main["name"], venue: main["_embedded"]["venues"].first["name"], date: main["dates"]["start"]["localDate"])
    byebug
end




