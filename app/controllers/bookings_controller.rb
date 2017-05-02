class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @bookings = Booking.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Program successfully booked"
      # redirect_to bookings_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @booking.update_attributes(booking_params)
      flash[:success] = "Booking successfully updated"
      # redirect_to bookings_path
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
  end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:title, :color, :start, :end, :user_id, :program_id)
    end
end