class ProgramsController < ApplicationController
  load_and_authorize_resource

  def index
    all_programs = Program.all

    if params[:search]
      @programs = all_programs.search(params[:search]).sort_by_name.paginate(page: params[:page], per_page: 10)
    else
      @programs = all_programs.sort_by_name.paginate(page: params[:page], per_page: 10)
    end

    @categories = Category.all
    @school_levels = SchoolLevel.all
    @latest_program = all_programs.last
  end

  def show
    @categories = Category.all
    @school_levels = SchoolLevel.all
    # @program = Program.find(params[:id])
  end
end
