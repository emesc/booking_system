class Admin::SchoolLevelsController < Admin::ApplicationController
  before_action :set_school_level, only: [:edit, :update, :destroy]

  def index
    @school_levels = SchoolLevel.all
    @categories = Category.all
  end

  def new
    @school_level = SchoolLevel.new
  end

  def create
    @school_level = SchoolLevel.new(school_level_params)
    if @school_level.save
      flash[:success] = "School level successfully created"
      redirect_to admin_school_levels_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @school_level.update_attributes(school_level_params)
      flash[:success] = "School level successfully updated"
      redirect_to admin_school_levels_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @school_level.destroy
    flash[:danger] = "Year #{@school_level.name} successfully deleted"
    redirect_to admin_school_levels_path
  end

  private

    def school_level_params
      params.require(:school_level).permit(:name)
    end

    def set_school_level
      @school_level = SchoolLevel.find(params[:id])
    end
end
