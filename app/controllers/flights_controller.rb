class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.name, airport.code] }
    @date_options = Flight.all.map { |flight| [flight.date.to_date.strftime("%d/%m/%Y"), flight.date.to_date] }
    @search_params = search_params

    if search_params.to_hash.map{ |k, v| v != "" }.any?
      @results = Flight.joins(:departure_airport, :arrival_airport)
      @results = @results.where(departure_airport: { code: search_params[:departure_airport] }) if search_params[:departure_airport] != ""
      @results = @results.where(arrival_airport: { code: search_params[:arrival_airport] }) if search_params[:arrival_airport] != ""
      @results = @results.where(date: search_params[:date]) if search_params[:date] != ""
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def search_params
    params.permit(:departure_airport, :arrival_airport, :passengers, :date)
  end
end
