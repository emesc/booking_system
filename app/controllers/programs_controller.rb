class ProgramsController < ApplicationController

  def index
    @programs = Program.paginate(page: params[:page], per_page: 10)
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @latest_program = Program.all.last
  end

  def show
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @program = Program.find(params[:id])
  end
end
