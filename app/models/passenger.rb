class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :email, presence: true, length: { minimum: 3, maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
