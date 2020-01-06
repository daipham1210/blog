Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], { redirect_uri: 'https://daipham.xyz/auth/github/callback' }
end