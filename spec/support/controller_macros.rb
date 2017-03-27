module ControllerMacros

  def login_admin(admin)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      # controller.stub(:authenticate_user!).and_return true
      allow(controller).to receive(:authenticate_user!).and_return true
      sign_in FactoryGirl.create(:user)
    end
  end

end
