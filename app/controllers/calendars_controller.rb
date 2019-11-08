class CalendarsController < ApplicationController
  def show
    @calendar = Calendar.find(params[:id])
  end
end
