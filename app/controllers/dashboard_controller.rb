class DashboardController < ApplicationController
  def index
    oauth_loader = OauthLoader.new
    @oauth_access_url = oauth_loader.get_access_url
    # @client = FitbitClient.new
    @client = oauth_loader.client
    session[:request_token] = oauth_loader.request_token
    session[:persisted_client] = @client
    session[:consumer_key] = oauth_loader.consumer_key
    session[:consumer_secret] = oauth_loader.consumer_secret
  end
end
