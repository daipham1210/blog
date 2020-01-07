class Auth::CallbacksController < ApplicationController
  def facebook
    # @user = User.from_omniauth(omniauth_params)

    # if @user.persisted?
    #   sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
    #   flash[:notice] = 'Sign in successfully.'
    # else
    #   session['devise.facebook_data'] = omniauth_params
    #   redirect_to new_user_session_path
    # end
  end

  def github
    @user = User.from_omniauth(omniauth_params)
    sign_in_and_redirect @user
  end

  def failure
    redirect_to :root
  end

  private

  def omniauth_params
    request.env['omniauth.auth']
  end
end
