class OauthLoader
  attr_reader :client, :consumer_key, :consumer_secret, :request_token
  Dotenv.load

  # Fitgem client docs: http://www.rubydoc.info/gems/fitbit/0.2.0/Fitbit/Client#activities_on_date-instance_method

  def initialize
    @consumer_key = ENV['FITBIT_CONSUMER_KEY']
    @consumer_secret = ENV['FITBIT_CONSUMER_SECRET']
    # Client is getting reinitialized on page start up
    @client = Fitgem::Client.new({:consumer_key => @consumer_key, :consumer_secret => @consumer_secret})
  end

  # Gets access to client

  def get_access_url
    @request_token = @client.request_token
    token = @request_token.token
    secret = @request_token.secret

    "http://www.fitbit.com/oauth/authorize?oauth_token=#{token}"
  end


  def time_not_moving(timeframe, client)
    parsed_timeframe = Chronic.parse(timeframe)
    activity = client.data_by_time_range('/activities/log/minutesSedentary', { base_date: parsed_timeframe, end_date: Time.now })
    # Returns value of current activity level
    activity["activities-log-minutesSedentary"].first["value"]
  end
end
