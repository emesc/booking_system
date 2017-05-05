class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # before_action :set_program, only: [:new, :create]
  # before_action :set_user, only: [:new, :create]

  def index
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @bookings = Booking.all    
  end

  def show
  end

  def new
    @booking = Booking.new
    @booking.program_id = params[:program_id]
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      flash[:success] = "Program successfully booked"
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @booking.update_attributes(booking_params)
      flash[:success] = "Booking successfully updated"
      redirect_to bookings_path
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    flash[:danger] = "Booking successfully removed"
    redirect_to bookings_path
  end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:preferred_date, :preferred_time, :notes, :program_id, :user_id)
    end

end