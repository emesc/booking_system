class MembershipsController < Devise::SessionsController
  
  def new
    @categories = Category.all
    @school_levels = SchoolLevel.all
  end
end