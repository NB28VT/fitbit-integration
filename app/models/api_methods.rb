class ApiMethods
  def get_activities(client)
    client.activities_on_date(Date.today)
  end

  # This method is duplicated in the AuthenticatedLoader
  def time_not_moving(timeframe, client)
    parsed_timeframe = Chronic.parse(timeframe)
    activity = client.data_by_time_range('/activities/log/minutesSedentary', { base_date: parsed_timeframe, end_date: Time.now })
    # Returns value of current activity level
    time = activity["activities-log-minutesSedentary"].first["value"]
  end

  def fairly_active_minutes(client)
    client.activities_on_date(Date.today)["summary"]["fairlyActiveMinutes"]
  end

  def lightly_active_minutes(client)
    client.activities_on_date(Date.today)["summary"]["lightlyActiveMinutes"]
  end

  def very_active_minutes(client)
    client.activities_on_date(Date.today)["summary"]["veryActiveMinutes"]
  end

  def floors(client)
    client.activities_on_date(Date.today)["summary"]["floors"]
  end

  def steps(client)
    client.activities_on_date(Date.today)["summary"]["steps"]
  end
end
