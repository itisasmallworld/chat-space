class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    current_user.groups.build
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, flash: {notice: "新規のグループが作成されました。"}
    else
      flash[:alert] = "新規のグループが作成されませんでした"
      render "new"
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :name)
  end
end
