class MembershipsController < Devise::SessionsController
  load_and_authorize_resource
  
  def new
    @categories = Category.all
    @school_levels = SchoolLevel.all
  end
end