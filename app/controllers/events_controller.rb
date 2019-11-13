require 'bundler'
Bundler.require
require 'byebug'
require 'time'


class EventsController < ApplicationController

  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')


  def index
    json = JSON.parse(RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&marketId=35&apikey=9Gi3bYz1RDWYyebA5yy6setBUgOQPG12&size=20')

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

    @categories = Category.all

  end


  def search
    if params[:search].blank?
      redirect_to events_path
    else
      @parameter = params[:search]
      @category = params[:category][:cat_id]

      if @category == "1"
        @selected_events = Event.all.where("lower(artist) LIKE :search", search: "%#{@parameter}%")
      elsif @category == "2"
        @selected_events = Event.all.where("lower(venue) LIKE :search", search: "%#{@parameter}%")
      elsif @category == "3"
        @selected_events = Event.all.where("lower(genre) LIKE :search", search: "%#{@parameter}%")
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  

end
