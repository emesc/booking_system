module BookingsHelper

  def set_program
    Program.find_by_id(params[:program_id]).program_title
  end

  def set_user
    user = current_user
    full_name(user.first_name, user.last_name)
  end
end