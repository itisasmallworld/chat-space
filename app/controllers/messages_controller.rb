class MessagesController < ApplicationController

  before_action :set_group, :set_groups, :set_messages, only:[:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to :group_messages, notice: "メッセージが投稿されました" }
        format.json
      end
    else
      flash[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
    params
      .require(:message)
      .permit(:image, :body)
      .merge(
        user_id: current_user.id,
        group_id: params[:group_id]
      )
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_groups
    @groups = current_user.groups
  end

  def set_messages
    @messages = @group.messages
  end

end
