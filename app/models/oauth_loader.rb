class OauthLoader
  attr_reader :client, :consumer_key, :consumer_secret, :request_token
  Dotenv.load


  def initialize
    @consumer_key = ENV['FITBIT_CONSUMER_KEY']
    @consumer_secret = ENV['FITBIT_CONSUMER_SECRET']
    # Client is getting reinitialized on page start up
    @client = Fitgem::Client.new({:consumer_key => @consumer_key, :consumer_secret => @consumer_secret})
    binding.pry
  end

  # Gets access to client

  def get_access_url
    @request_token = @client.request_token
    token = @request_token.token
    secret = @request_token.secret

    "http://www.fitbit.com/oauth/authorize?oauth_token=#{token}"
  end
end
