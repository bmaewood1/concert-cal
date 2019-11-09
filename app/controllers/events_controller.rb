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

    @event_array = []

    event_hash = {
      artist: nil,
      venue: nil,
      date: nil
    }
  
    json["_embedded"]["events"].select do |main|
        event_hash[:artist] = main["name"]
        event_hash[:venue] = main["_embedded"]["venues"].first["name"]
        event_hash[:date] = main["dates"]["start"]["localDate"]
        counter = 0
        while counter < 5 
          @event_array[counter] = event_hash
        end
        byebug
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
