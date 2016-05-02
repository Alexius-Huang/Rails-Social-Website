class HomeController < ApplicationController
  def welcome
  	@topics = Topic.all
  	@topic = Topic.new
  	@articles = Article.order("created_at DESC").take(3)
  end
end
