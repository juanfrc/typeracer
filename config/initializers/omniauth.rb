OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FACEBOOK_API"], ENV["FACEBOOK_SECRET"], image_size: 'large'
end