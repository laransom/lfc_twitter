require 'twitter'
require 'pry'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "QyqlqT76NR3xl0U07WCVjw"
  config.consumer_secret     = "dKJu9D5bQ9S4CyLN4GOB9sZqVRPvYRAUEXupCu40"
  config.access_token        = "253824150-tQozH7LObXHn12R5kmJXac5xu1bMUwj9919AsHTN"
  config.access_token_secret = "HXwjJ8ruof3hyyE8yuVmnWE1vTgGLgXA8wO31yOReV4zB"
end

client_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "QyqlqT76NR3xl0U07WCVjw"
  config.consumer_secret     = "dKJu9D5bQ9S4CyLN4GOB9sZqVRPvYRAUEXupCu40"
  config.access_token        = "253824150-tQozH7LObXHn12R5kmJXac5xu1bMUwj9919AsHTN"
  config.access_token_secret = "HXwjJ8ruof3hyyE8yuVmnWE1vTgGLgXA8wO31yOReV4zB"
end

client.search("to:LFC", :result_type => "recent").take(10).collect do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
end


# topics = ["LFC"]
# client.filter(:track => topics.join(",")) do |object|
#   puts object.text if object.is_a?(Twitter::Tweet)
# end
