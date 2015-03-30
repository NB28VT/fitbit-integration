class AuthenticatedLoader
  def oauth_access(verifier, client, consumer_key, consumer_secret, request_token)
    token = request_token.token
    secret = request_token.secret
    access_token = client.authorize(token, secret, { :oauth_verifier => verifier })

    token = access_token.token
    secret = access_token.secret
    # Need way to pass in user id through UX
    user_id = '3B8C8S'
    authenticated_client = Fitgem::Client.new({:consumer_key => consumer_key, :consumer_secret => consumer_secret, :token => token, :secret => secret, :user_id => user_id})
    access_token = client.reconnect(token, secret)
    # Pass client to runner here
    authenticated_client
  end

  def time_not_moving(timeframe, client)
    parsed_timeframe = Chronic.parse(timeframe)
    activity = client.data_by_time_range('/activities/log/minutesSedentary', { base_date: parsed_timeframe, end_date: Time.now })
    # Returns value of current activity level
    activity["activities-log-minutesSedentary"].first["value"]
  end
end
