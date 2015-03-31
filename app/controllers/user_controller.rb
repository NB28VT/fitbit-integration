class UserController < ApplicationController
  def index
    authenticated_loader = AuthenticatedLoader.new
    # Helper in application controller
    user = current_user
    authenticated_user = oauth_load_session_helper(authenticated_loader, user)
    api_methods = ApiMethods.new
    @activities_hash = api_methods.get_activities(authenticated_user)
    @time_not_moving_today = api_methods.time_not_moving("Now", authenticated_user)
    @fairly_active_minutes = api_methods.fairly_active_minutes(authenticated_user)
  end
end
