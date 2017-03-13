class Admin::ProgramsController < Admin::ApplicationController
  # before_action :set_program, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # authorize_resource class: false

  def index
    if params[:search]
      @programs = Program.search(params[:search]).sort_by_name.paginate(page: params[:page], per_page: 10)
    else
      @programs = Program.sort_by_name.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
  end

  def new
    @program = Program.new
    @school_levels = SchoolLevel.all
  end

  def create
    @program = Program.new(program_params)
    @program.user_id = current_user.id
    if @program.save
      flash[:success] = "Program successfully created"
      redirect_to admin_program_path(@program)
    else
      render 'new'
    end
  end

  def edit
    @school_levels = SchoolLevel.all
  end

  def update
    if @program.update_attributes(program_params)
      flash[:success] = "Program successfully updated"
      redirect_to admin_program_path(@program)
    else
      render 'edit'
    end
  end

  def destroy
    @program.destroy
    flash[:danger] = "Program #{@program.program_title} successfully deleted"
    redirect_to admin_programs_path
  end

  private

    def program_params
      params.require(:program).permit(:program_title, :program_description, :program_fee, :duration, :image, :image_title, :topics, :group_size_min, :group_size_max, :time_am, :time_pm, :user_id, :category_id, :delivery_mode_id, school_level_ids: [])
    end

    # def set_program
    #   @program = Program.find(params[:id])
    # end
end
