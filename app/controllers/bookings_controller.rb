class BookingsController < ApplicationController
  def new
    validate_booking_params
    
    @flight = Flight.find(booking_params[:flight])
    @passengers = booking_params[:passengers]
  end

  def create
  end

  private

  def validate_booking_params
    if %i[ flight passengers ].map { |s| !params.has_key?(s) || params[s].empty? }.any? ||
       !Flight.exists?(id: booking_params[:flight]) || !booking_params[:passengers].positive?

      if request.referer.nil?
        redirect_to root_url
      else
        redirect_to request.referer, status: :unprocessable_entity
      end
    end
  end

  def booking_params
    p = params.permit(:flight, :passengers).to_h
    p.update(p) { |k,v| v.to_i }
  end
end
