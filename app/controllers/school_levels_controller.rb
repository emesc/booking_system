class SchoolLevelsController < ApplicationController
  def show
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @school_level = @school_levels.find(params[:id])
    @programs = @school_level.programs.paginate(page: params[:page], per_page: 10)
  end
end
