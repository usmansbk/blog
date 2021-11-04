module ControllerMacros
  def login_user
    before(:each) do
      user = User.first
      sign_in user
    end
  end
end
