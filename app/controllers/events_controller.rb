class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Program successfully booked"
      # redirect_to bookings_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Booking successfully updated"
      # redirect_to bookings_path
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
  end

  private

    def set_booking
      @event = Event.find(params[:id])
    end

    def booking_params
      params.require(:event).permit(:title, :color, :start, :end, :user_id, :program_id)
    end
end