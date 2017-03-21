class GroupsController < ApplicationController

  before_action :set_group_find, only:[:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: :新規のグループが作成されました
    else
      flash[:alert] = :新規のグループが作成されませんでした
      render "new"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: :グループが更新されました
    else
      flash[:alert] = :グループが更新されませんでした
      render "edit"
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end

  def set_group_find
    @group = Group.find(params[:id])
  end
end
