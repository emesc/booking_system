class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @category = Category.find(params[:id])
    @programs = @category.programs.paginate(page: params[:page], per_page: 10)
  end
end
