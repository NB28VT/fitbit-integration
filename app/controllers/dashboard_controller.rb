class DashboardController < ApplicationController
  def index
    oauth_loader = OauthLoader.new
    @oauth_access_url = oauth_loader.get_access_url
    
  end
end
