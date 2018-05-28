Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE-KEY'] ENV['GOOGLE-SECRET']
  provider :github, ENV['GITHUB-KEY'], ENV['GITHUB-SECRET'] 
end
