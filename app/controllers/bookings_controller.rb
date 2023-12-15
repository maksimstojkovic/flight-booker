class BookingsController < ApplicationController
  before_action :validate_booking_params, only: :new

  def new
    @flight = Flight.find(booking_params[:flight])
    booking_params[:passengers].times do
      @flight.passengers.new
    end
  end

  def create
  end

  private

  def validate_booking_params
    if !booking_params.values.all? { |v| v.present? } ||
       !Flight.exists?(id: booking_params[:flight]) || !booking_params[:passengers].positive?

      if request.referer.nil?
        redirect_to root_url
      else
        redirect_to request.referer, status: :unprocessable_entity
      end
    end
  end

  def booking_params
    p = params.require(:booking).permit(:flight, :passengers).to_h
    p.update(p) { |k,v| v.to_i }
  end
end
