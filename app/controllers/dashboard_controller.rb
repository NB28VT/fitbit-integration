class DashboardController < ApplicationController
  def index
    # Dry this up with a helper
    oauth_loader = OauthLoader.new
    @oauth_access_url = oauth_loader.get_access_url
    # @client = FitbitClient.new
    @client = oauth_loader.client
    oauth_save_session_helper(@client, oauth_loader)
  end
end
