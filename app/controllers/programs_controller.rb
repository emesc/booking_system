class ProgramsController < ApplicationController

  def index
    @programs = Program.all
    @categories = Category.all
    @school_levels = SchoolLevel.all
  end

  def show
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @program = Program.find(params[:id])
  end
end
