class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @bookings = Booking.all
    @pending_bookings = Booking.where(status: 0)
    @approved_bookings = Booking.where(status: 1)
    @bookings_done = Booking.where(status: 2)
  end

  def approved_bookings
    @pending_bookings = Booking.where(status: 0)
    @approved_bookings = Booking.where(status: 1)
    @bookings_done = Booking.where(status: 2)
    @booking = Booking.find(params[:id])
    @booking.update_attributes(:status => 1)
    respond_to do |format|
      if @booking.update(:status => 1)
        format.js
      else
        format.js
      end
    end
  end

  def mobile_approved_bookings
    @booking = Booking.find(params[:id])
    @booking.update_attributes(:status => 1)
    redirect_to :back
  end

  def bookings_done
    @pending_bookings = Booking.where(status: 0)
    @approved_bookings = Booking.where(status: 1)
    @bookings_done = Booking.where(status: 2)
    @booking = Booking.find(params[:id])
    @booking.update_attributes(:status => 2)
    respond_to do |format|
      if @booking.update(:status => 2)
        format.js
      else
        format.js
      end
    end
  end

  def mobile_bookings_done
    @booking = Booking.find(params[:id])
    @booking.update_attributes(:status => 2)
    redirect_to :back
  end

  def show
    respond_with(@booking)
  end

  def new
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

  def create
    @userclub = Club.find(User.find(current_user.id).club_id)
    @booking = Booking.new(booking_params)
    if club_bookings(@userclub) < 3
      @booking.user_id = current_user.id
      @booking.status = 0
      @booking.save
    else
    end
    respond_with(@booking)
  end
  
  
  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :movie_id, :status)
    end
end
