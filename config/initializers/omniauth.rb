OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1589784584597402", "542746549c7f640dea96e1b4fee79bb5", image_size: 'large'
end