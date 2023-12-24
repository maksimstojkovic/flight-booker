# Flight Booker

A Rails application which allows users to search for and book flights.

The following are used as part of this project:
* Advanced form building
* Nested attributes
* Partials
* Routing subsets
* GET route parameters
* POST route parameters
* Parameter validation
* Mailers ([`letter_opener`](https://github.com/ryanb/letter_opener))

The mailer can be tested using the following command:

```ruby
PassengerMailer.with(passenger: Passenger.first, flight: Flight.first).confirmation_email.deliver_now!
```
