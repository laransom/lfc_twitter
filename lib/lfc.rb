require 'twitter'




def tweet_rating(string)
  rating = 0
  if string.split.include?('champions') || string.include?('league title') || string.include?('happy') || string.include?('believe') || string.include?('title') || string.include?('best') || string.include?('greatest') || string.include?('awesome') || string.include?('fantastic') || string.include?('beauty') || string.include?('win') || string.include?('dream')
    rating = 0.1
  elsif string.split.include?('loser') || string.include?('gutted') || string.include?('horrible') || string.include?('sad') || string.include?('worst') || string.include?('terrible') || string.include?('bottom') || string.include?('sack') || string.include?('rubbish') || string.include?('tears') || string.include?('forget')
    rating = - 0.1
  end
  if rating > 100
    rating = 100
  elsif rating < 0
    rating = 0
  end
  rating
end


class Tweet

  def self.search_for_lfc
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "*****"
      config.consumer_secret     = "*****"
      config.access_token        = "*****"
      config.access_token_secret = "*****"
    end
    client.search("to:LFC", result_type: "recent").take(10)
  end


  def self.create_rating
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "*****"
        config.consumer_secret     = "*****"
        config.access_token        = "*****"
        config.access_token_secret = "*****"
      end
      rating = 50
      client.search("to:LFC", result_type: "recent").take(10000).collect do |tweet|
        rating += tweet_rating(tweet.text)
      end

      rating.to_i

  end


end


