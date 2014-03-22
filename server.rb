require 'sinatra'
require 'shotgun'
require 'net/http'
require 'json'
require 'pry'
require_relative 'lib/lfc.rb'

get '/' do
  @tweets = Tweet.search_for_lfc
  @rating = Tweet.create_rating
  erb :index
end

helpers do

  def format_tweet(tweet)
    oembed_url = URI("https://api.twitter.com/1/statuses/oembed.json?id=#{tweet.id}&align=center")
    response = JSON.parse(Net::HTTP.get(oembed_url))
    response["html"]
  end
end
