class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.includes(:comments, comments: :user).find(params[:id])
  end
end
