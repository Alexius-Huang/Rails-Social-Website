class TopicsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :find_user

	def index
		# Browse All the Articles
		@highlight_token = "All Articles"
		@topics = @user.topics.all
		@new_topic = @user.topics.new
		@articles = @user.articles.order("created_at DESC").paginate(page: params[:page], per_page: 3)
		@truncate = true
		@pinterest = true
	end

	def create
		@topic = @user.topics.create(topic_params)

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@topics = @user.topics.all
		@topic = @user.topics.find(params[:id])
		@new_topic = @user.topics.new
		@highlight_token = @topic.title
		@articles = @topic.articles.order("created_at DESC").paginate(page: params[:page], per_page: 3)
		@truncate = true
		@pinterest = true
	end

	def destroy
		@topic = @user.topics.find(params[:id])
		@topic.destroy
		redirect_to :back, alert: "The Article Category Has Been Destroyed!"
	end

	private

	def topic_params
		params.require(:topic).permit(:title)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

end
