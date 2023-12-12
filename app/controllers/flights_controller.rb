class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @date_options = Flight.all.map { |flight| [flight.date.to_date.strftime("%d/%m/%Y"), flight.date.to_date] }
  end
end
