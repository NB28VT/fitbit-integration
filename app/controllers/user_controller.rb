class UserController < ApplicationController
  def index
    # Dry this up with a helper
    authenticated_loader = AuthenticatedLoader.new
    user = oauth_load_session_helper(authenticated_loader)
    time_not_moving_today = authenticated_loader.time_not_moving("Now", user)
  end
end
