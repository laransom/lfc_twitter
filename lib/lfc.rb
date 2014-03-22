require 'twitter'
require 'pry'

class Tweet

  def self.search_for_lfc
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "QyqlqT76NR3xl0U07WCVjw"
      config.consumer_secret     = "dKJu9D5bQ9S4CyLN4GOB9sZqVRPvYRAUEXupCu40"
      config.access_token        = "253824150-tQozH7LObXHn12R5kmJXac5xu1bMUwj9919AsHTN"
      config.access_token_secret = "HXwjJ8ruof3hyyE8yuVmnWE1vTgGLgXA8wO31yOReV4zB"
    end
    tweets = []
    client.search("to:LFC", result_type: "recent").take(10).collect do |tweet|
      tweets << "#{tweet.user.screen_name}: #{tweet.text}"
    end
    tweets

  end

  def self.say_hello
    puts "hello world"
  end

end

