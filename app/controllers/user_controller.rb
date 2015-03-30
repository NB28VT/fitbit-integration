class UserController < ApplicationController
  def index
    authenticated_loader = AuthenticatedLoader.new
    verifier = params[:verifier]
    client = session[:persisted_client]
    consumer_key = session[:consumer_key]
    consumer_secret = session[:consumer_secret]
    request_token = session[:request_token]
    consumer_key = session[:consumer_key]
    authenticated_loader.oauth_access(params[:verifier],
      client,
      consumer_key,
      consumer_secret,
      request_token
      )
  end
end
