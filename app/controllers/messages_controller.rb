  class MessagesController < ApplicationController

  def index
    @groups = Group.new
  end
end
