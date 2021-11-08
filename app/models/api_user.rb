class ApiUser < User
	include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

	validates :jti, presence: true

	self.skip_session_storage = [:http_auth, :params_auth]

	def generate_jwt
		JWT.encode({ id: id, exp: 5.days.from_now.to_i }, ENV['DEVISE_JWT_SECRET_KEY'])
	end
end
