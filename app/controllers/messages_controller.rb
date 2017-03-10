class MessagesController < ApplicationController
  def new
    @categories = Category.all
    @school_levels = SchoolLevel.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
  end

  private

    def message_params
      params.require(:message).permit(:name, :subject, :content)
    end
end
