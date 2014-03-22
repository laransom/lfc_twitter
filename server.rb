require 'sinatra'
require 'shotgun'
require 'pry'
require_relative 'lib/lfc.rb'

get '/' do
  @tweets = Tweet.search_for_lfc
  erb :index
end
