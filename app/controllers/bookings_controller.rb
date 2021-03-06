class BookingsController < ApplicationController
  before_action :set_booking, except: [:index, :new, :create]
  before_action :set_bookings, only: [:index, :approved_bookings, :bookings_done]
  before_filter :authenticate_user!

  respond_to :html

  def index
  end

  def approved_bookings
    @booking.update_attributes(:status => 1)
    respond_to do |format|
      format.js
    end
  end

  def mobile_approved_bookings
    @booking.update_attributes(:status => 1)
    redirect_to :back
  end

  def bookings_done
    @booking.update_attributes(:status => 2)
    respond_to do |format|
      format.js
    end
  end

  def mobile_bookings_done
    @booking.update_attributes(:status => 2)
    redirect_to :back
  end

  def show
  end

  def new
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

  def create
    # Dont allow admins to book to prevent nil error in bookings index
    unless current_user.access == 2
      @booking = Booking.new(booking_params)
      @booking.save_booking(current_user)
      respond_with(@booking)
    end
    redirect_to :back
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
    
    def set_bookings
      @pending_bookings = Booking.where(status: 0)
      @approved_bookings = Booking.where(status: 1)
      @bookings_done = Booking.where(status: 2)
    end

    def booking_params
      params.require(:booking).permit(:user_id, :movie_id, :status)
    end
end
