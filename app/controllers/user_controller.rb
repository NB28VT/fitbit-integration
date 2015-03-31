class UserController < ApplicationController
  def index
    # Dry this up with a helper
    authenticated_loader = AuthenticatedLoader.new
    user = oauth_load_session_helper(authenticated_loader)
    api_methods = ApiMethods.new
    @activities_hash = api_methods.get_activities(user)
    @time_not_moving_today = api_methods.time_not_moving("Now", user)
    @fairly_active_minutes = api_methods.fairly_active_minutes(user)
  end
end
