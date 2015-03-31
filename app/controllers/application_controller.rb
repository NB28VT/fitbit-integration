class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Devise permit additional params
  before_action :configure_permitted_parameters, if: :devise_controller?

  def oauth_save_session_helper(client, oauth_loader)
    # Passes Oauth authentication into session hash
    session[:request_token] = oauth_loader.request_token
    session[:persisted_client] = client
    session[:consumer_key] = oauth_loader.consumer_key
    session[:consumer_secret] = oauth_loader.consumer_secret
  end

  def oauth_load_session_helper(authenticated_loader,user)
    verifier = user.verifier
    client = session[:persisted_client]
    consumer_key = session[:consumer_key]
    consumer_secret = session[:consumer_secret]
    request_token = session[:request_token]
    consumer_key = session[:consumer_key]
    user = authenticated_loader.oauth_access(verifier
      client,
      consumer_key,
      consumer_secret,
      request_token
      )
  end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :verifier
 end
end
