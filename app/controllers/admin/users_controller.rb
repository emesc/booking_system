class Admin::UsersController < Admin::ApplicationController
  skip_before_action :verify_admin
  before_action :redirect_regulars
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @users = User.admins_first.paginate(page: params[:page], per_page: 10)
    elsif current_user.manager?
      @users = User.where(creator_id: current_user.id).paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    # it's ok to show user details if current user is admin or manager; otherwise, it will log out if redirected to this action thru admin_user_path(@user) from create or update action (I think it runs this action iff current_user == @user)
    if ((current_user.admin? || current_user.manager?) && @user.current_sign_in_at)
      @last_login = @user.current_sign_in_at
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.creator_id = current_user.id
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # use devise's leave password blank during update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated =  if needs_password?(@user, user_params)
                              @user.update_attributes(user_params)
                            else
                              @user.update_without_password(user_params)
                            end

    if successfully_updated
      flash[:success] = "User successfully updated"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = "User successfully deleted"
    redirect_to admin_users_path
  end

  private

    def redirect_regulars
      if current_user.try(:regular?)
        redirect_to root_url
        flash[:danger] = "You are not authorized to access this page."
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_id)
    end

    def set_user
      @user = User.find(params[:id])
    end

  protected

    def needs_password?(user, params)
      params[:password].present?
    end
end
