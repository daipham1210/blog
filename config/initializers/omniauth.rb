require 'omniauth-github'

OmniAuth.config.full_host = Rails.env.production? ? 'http://daipham.xyz' : 'http://localhost:3000'

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :github, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
#     name: 'google',
#     scope: 'email, profile, plus.me',
#     prompt: 'select_account',
#     image_aspect_ratio: 'square',
#     image_size: 50,
#     setup: (lambda do |env|
#       request = Rack::Request.new(env)
#       env['omniauth.strategy'].options['token_params'] = {
#         redirect_uri: 'http://localhost:3000/auth/google/callback'
#       }
#     end)
#   }
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], { 
    redirect_uri: 'http://daipham.xyz/auth/github/callback',
    setup: (lambda do |env|
      request = Rack::Request.new(env)
      env['omniauth.strategy'].options['token_params'] = {
        redirect_uri: 'http://daipham.xyz/auth/github/callback'
      }
    end) 
  }
end