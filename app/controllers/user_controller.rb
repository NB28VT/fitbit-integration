class UserController < ApplicationController
  def index
    # Dry this up with a helper
    authenticated_loader = AuthenticatedLoader.new
    verifier = params[:verifier]
    client = session[:persisted_client]
    consumer_key = session[:consumer_key]
    consumer_secret = session[:consumer_secret]
    request_token = session[:request_token]
    consumer_key = session[:consumer_key]
    user = authenticated_loader.oauth_access(params[:verifier],
      client,
      consumer_key,
      consumer_secret,
      request_token
      )
    time = authenticated_loader.time_not_moving("Now", client)
  end
end
