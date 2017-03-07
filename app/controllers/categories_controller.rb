class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @category = @categories.find(params[:id])
    @programs = @category.programs.sort_by_name.paginate(page: params[:page], per_page: 10)
  end
end
