require 'bundler'
Bundler.require
require 'byebug'

class EventsController < ApplicationController

  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')


  def index
    json = JSON.parse(RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&marketId=35&apikey=9Gi3bYz1RDWYyebA5yy6setBUgOQPG12')

    @events = []


    json["_embedded"]["events"].each do |main|
      @events << Event.create(artist: main["name"], venue: main["_embedded"]["venues"].first["name"], date: main["dates"]["start"]["localDate"])
    end

  end

  def show
    @event = Event.find(params[:id])
  end
  

end
