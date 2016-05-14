class MessagesController < ApplicationController
  skip_before_action :ensure_authenticated_user, only: [:show]

  def index
    @messages = Message.all
  end

  def show
    @message = Message.includes(:comments, comments: :user).find(params[:id])
    respond_to do |format|
     format.html
     format.json { render(partial: 'messages/message.json', locals: {message: @message})}
    end
  end
end
