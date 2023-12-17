class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def new
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    if @booking.save
      redirect_to flat_path(@flat), notice: "Booking correctly created!"
    else
      redirect_to flat_path(@flat), alert: "Problem"
    end
  end

  def show
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
