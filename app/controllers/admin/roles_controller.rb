class Admin::RolesController < Admin::ApplicationController
  load_and_authorize_resource
  # authorize_resource class: false
  
  def index
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @roles = Role.all
  end

  def show
    # @role = Role.find(params[:id])
  end
end
