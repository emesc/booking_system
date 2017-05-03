module BookingsHelper

  def set_program
    Program.find_by_id(params[:program_id])
  end

  def set_user
    user = User.find_by_id(params[:user_id])
    full_name(user.first_name, user.last_name)
  end
end