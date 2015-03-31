class Nanny

  def initialize(user)
    @api_methods = ApiMethods.new
    # Pass in user object here
    @user = user
  end

  # Dry this up later

  def have_you_been_bad
    # Shut off overnight
    if Time.now.hour.between?(23,7)
      # Dry this up
      time_not_moving = @api_methods.time_not_moving("Now", @user)
      time_lightly_active = @api_methods.lightly_active_minutes(@user)
      time_fairly_active = @api_methods.fairly_active_minutes(@user)
      very_active_minutes = @api_methods.very_active_minutes(@user)
      floors = @api_methods.floors(@user)
      steps = @api_methods.steps (@user)

      check_target(@user, @user.sedentary_target, time_not_moving)
      check_target(@user, @user.fairly_active_target, time_fairly_active)
      check_target(@user, @user.lightly_active_target, time_lightly_active)
      check_target(@user, @user.very_active_target, very_active_minutes)
      check_target(@user, @user.floor_target, floors)
      check_target(@user, @user.steps_target, steps)
    end
  end

  def check_target(user, target, actual)
    # 1,440 minutes in a day
    # 720 half day
    # 360 quarter day
    if actual > target
      # Shock the Monkey. HARD!
      # If getting close: 2 hours of laziness away
    elsif (target - actual) <= 120
      # Shock the Monkey. Medium
      # If 4 hours of laziness away
    elsif (target - actual) <= 240
      # Vibrate the monkey
    end
  end
end
