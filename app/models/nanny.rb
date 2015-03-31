class Nanny

  def initialize(user)
    @api_methods = ApiMethods.new
    @user = user
  end
  # Dry this up later

  def have_you_been_bad
    # Shut off overnight
    if Time.now.hour.between?(23,7)
      time_not_moving = @api_methods.time_not_moving("Now", @user)
      time_fairly_active = @api_methods.fairly_active_minutes(@user)
      # Pass user, target, and actual to nanny function
      nanny.check_target(@user, @user.sedentary_target, time_not_moving)
      nanny.check_target(@user,
        @user.fairly_active_target,
        time_fairly_active
      )
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
