Warden::JWTAuth.configure do |config|
	config.secret = ENV['DEVISE_JWT_SECRET_KEY']
end