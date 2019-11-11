require 'bundler'
Bundler.require
require 'byebug'
require 'time'


class EventsController < ApplicationController

  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')


  def index
    json = JSON.parse(RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&marketId=35&apikey=9Gi3bYz1RDWYyebA5yy6setBUgOQPG12&size=50')

    @events = []

    json["_embedded"]["events"].each do |main|
      @events << Event.find_or_create_by(
        artist: main["name"], 
        venue: main["_embedded"]["venues"].first["name"], 
        date: Time.parse(main["dates"]["start"]["localDate"]), 
        image: main["images"][1]["url"], ticket_url: main["url"],
        genre: main["classifications"].first["genre"]["name"]
      )
    end

    @events = Event.order('date ASC')

  end

  def search
    if params[:search].blank?
      redirect_to events_path
    else
      @parameter = params[:search].downcase
      @selected_events = Event.all.where("lower(artist) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  

end
