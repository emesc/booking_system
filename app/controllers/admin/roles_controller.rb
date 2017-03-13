class Admin::RolesController < Admin::ApplicationController
  
  def index
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end
end
