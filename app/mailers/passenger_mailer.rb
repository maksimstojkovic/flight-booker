class PassengerMailer < ApplicationMailer
  default from: "notifications@flightbooker.com"

  def confirmation_email
    @passenger = params[:passenger]
    @flight  = params[:flight]
    mail(to: @passenger.email, subject: "Flight Details")
  end
end
