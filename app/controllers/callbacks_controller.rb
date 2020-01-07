class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    Rails.logger.info @user.email
    sign_in_and_redirect @user
  end
end
