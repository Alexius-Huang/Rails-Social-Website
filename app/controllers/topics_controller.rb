class TopicsController < ApplicationController
	
	def index
		# Browse All the Articles
		@highlight_token = nil
		@topics = Topic.all
		@new_topic = Topic.new
		@articles = Article.order("created_at DESC").paginate(page: params[:page], per_page: 6)
	end

	def create
		@topic = Topic.create(topic_params)

		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	def show
		@topics = Topic.all
		@topic = Topic.find(params[:id])
		@new_topic = Topic.new
		@highlight_token = @topic.title
		@articles = @topic.articles.order("created_at DESC").paginate(page: params[:page], per_page: 6)
	end

	private

	def topic_params
		params.require(:topic).permit(:title)
	end
end
