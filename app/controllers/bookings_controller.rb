class BookingsController < ApplicationController
  before_action :validate_booking_params, only: :new

  def new
    @flight = Flight.find(booking_params[:flight])
    @passengers = Array.new(booking_params[:passengers]) { @flight.passengers.new }
  end

  def create
    @flight = Flight.find(create_params[:flight])
    @passengers = create_params[:passengers_attributes].values.map { |p| @flight.passengers.new(p) }

    if @passengers.map { |p| p.valid? }.all?
      @passengers.each do |p|
        p.save
        @flight.bookings.create(passenger: p)
        PassengerMailer.with(passenger: p, flight: @flight).confirmation_email.deliver_now
      end
      redirect_to flight_path(@flight)
    else
      render :new, status: :unprocessable_entity
    end
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
  
  def create_params
    params.require(:create_booking).permit(:flight, passengers_attributes: [:name, :email])
  end
end
