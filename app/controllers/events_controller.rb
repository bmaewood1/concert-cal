require 'bundler'
Bundler.require
require 'byebug'

class EventsController < ApplicationController

  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')

  # json = JSON.parse(RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&marketId=35&apikey=9Gi3bYz1RDWYyebA5yy6setBUgOQPG12')

  # event_array = []

  # event_hash = {
  #   artist: nil,
  #   venue: nil,
  #   date: nil
  # }

  # json["_embedded"]["events"].each do |main|
  #     event_hash[:artist] = main["name"]
  #     event_hash[:venue] = main["_embedded"]["venues"].first["name"]
  #     event_hash[:date] = main["dates"]["start"]["localDate"]
  #     event_hash << event_array
  #     byebug
  # end

  def index
    json = JSON.parse(RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&marketId=35&apikey=9Gi3bYz1RDWYyebA5yy6setBUgOQPG12')

    @events = []

    # event_hash = {
    #   artist: nil,
    #   venue: nil,
    #   date: nil
    # }
  
      # counter = 0
      # while counter < 10
      #   json["_embedded"]["events"].each do |main|
      #     event_hash[:artist] = main["name"]
      #     event_hash[:venue] = main["_embedded"]["venues"].first["name"]
      #     event_hash[:date] = main["dates"]["start"]["localDate"]
      #     @event_array[counter] = event_hash
      #     counter += 1
      #     byebug
      #   end
      # end

      counter = 0
      while counter < 5
        json["_embedded"]["events"].each do |main|
          @events[counter] = Event.create(artist: main["name"], venue: main["_embedded"]["venues"].first["name"], date: main["dates"]["start"]["localDate"])
          counter += 1
        end
      end

    
    
      # count = 0
      # @event_array[count] = event_hash
      # count += 1
      # byebug

    end

  def show
    @event = Event.find(params[:id])
  end

end
