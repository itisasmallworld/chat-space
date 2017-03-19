class GroupsController < ApplicationController

  def index
    @groups = current_user.groups

  end

  def new
    @group = Group.new
  end

  def create
    binding.pry
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
    params.require(:group).permit(:group_name, user_ids: [])
  end
end

# 中間テーブルに自動的にレコードが入るようにする記述が必要！！