class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @date_options = Flight.all.map { |flight| [flight.date.to_date.strftime("%d/%m/%Y"), flight.date.to_date] }
    @search_params = search_params

    if search_params.to_hash.map{ |k, v| v != "" }.any?
      @results = Flight.all
      @results = @results.where(departure_airport_id: search_params[:departure_airport]) if search_params[:departure_airport] != ""
      @results = @results.where(arrival_airport_id: search_params[:arrival_airport]) if search_params[:arrival_airport] != ""
      @results = @results.where(date: search_params[:date]) if search_params[:date] != ""
    end
  end

  private

  def search_params
    p = params.permit(:departure_airport, :arrival_airport, :passengers, :date)
  end
end
