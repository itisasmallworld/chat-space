require 'rails_helper'

describe MessagesController do

  login_user
  let(:group) {create(:group)}

  describe 'GET #index' do

    before do
      get :index, params: { group_id: group.id }
    end

    it "assigns the requested contact @message" do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact @messages" do
      expect(assigns(:messages)).to eq group.messages
    end

    it "assigns the requested contact @group" do
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested contact @groups" do
      expect(assigns(:groups)).to eq subject.current_user.groups
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

  end
end
