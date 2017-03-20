class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, flash: {notice: :新規のグループが作成されました}
    else
      flash[:alert] = :新規のグループが作成されませんでした
      render "new"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), flash: {notice: :グループが更新されました}
    else
      flash[:alert] = :グループが更新されませんでした
      render "edit"
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end
end
