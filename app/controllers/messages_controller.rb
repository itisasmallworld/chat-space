class MessagesController < ApplicationController

  before_action :set_group, :set_message, only:[:index, :create]

  def index
  end

  def create
    if @message.save
      redirect_to group_messages_path, notice: "メッセージが投稿されました"
    else
      flash[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:image, :body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def set_message
    @message = Message.new
    @messages = @group.messages
  end

end
