class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_airport_options = Airport.all.map{ |f| [f.code, f.id] }
    @arrival_airport_options = Airport.all.map{ |f| [f.code, f.id] }
    @start_datetime_options = Flight
      .select(:start_datetime)
      .distinct
      .order(:start_datetime)
      .map{ |f| [f.start_datetime.strftime('%d/%m/%Y'), f.id] }
    @search_results = Flight.where(
      departure_airport: params[:departure_airport],
      arrival_airport: params[:arrival_airport]
    )
  end
end
