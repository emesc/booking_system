class BookingsController < ApplicationController
  def index
    @categories = Category.all
    @school_levels = SchoolLevel.all
  end
end