class BookingsController < ApplicationController
  def new
    validate_booking_params
  end

  def create
  end

  private

  def validate_booking_params
    if %i[ flight passengers ].map { |s| !params.has_key?(s) || params[s].empty? }.any?
      if request.referer.nil?
        redirect_to root_url
      else
        redirect_to request.referer, status: :unprocessable_entity
      end
    end
  end

  def booking_params
    params.permit(:flight, :passengers)
  end
end
