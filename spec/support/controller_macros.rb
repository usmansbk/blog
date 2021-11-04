module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin) # Using factory bot as an example
    end
  end

  def login_user
    before(:each) do
			user = User.first
      sign_in user
    end
  end
end
