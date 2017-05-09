class RouteGlobController < ApplicationController

  def index
    @program = Program.where("program_title LIKE ? or program_description LIKE ?", "%#{params[:path]}%", "%#{params[:path]}%").first
    if @program
      redirect_to program_path(@program)
    else
      flash[:warning] = "The item or action you were looking for does not exist. You may use the search form instead."
      redirect_to root_path
    end
  end
end