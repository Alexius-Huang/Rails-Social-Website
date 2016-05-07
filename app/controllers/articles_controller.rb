class ArticlesController < ApplicationController
	before_action :find_topic

	def new
		@article = @topic.articles.new
	end

	def create
		@article = @topic.articles.create(article_params)

		if @article.save
			redirect_to @topic
		else
			render :new
		end
	end

	def show
		@article = @topic.articles.find(params[:id])
		@highlight_token = @topic.title
		@truncate = false
		@pinterest = true
	end

	def edit
		@article = @topic.articles.find(params[:id])
	end

	def update
		@article = @topic.articles.find(params[:id])
		
		if @article.update(article_params)
			redirect_to topic_article_path(@topic, @article)
		else
			render :edit
		end
	end

	def destroy
		@article = @topic.articles.find(params[:id])
		@article.destroy
		redirect_to @topic
	end

	private 

	def article_params
		params.require(:article).permit(:title, :content)
	end

	def find_topic
		@topic = Topic.find(params[:topic_id])
	end
end
