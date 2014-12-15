class ArticlesController < ApplicationController

	before filter :authenticate_user!, :except => [:index, :show]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
	end

  def index
  end

  def show
  	@article = Article.find(params[:id])
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy

  	redirect_to articles_path
  end

  private
  def article_params
  	params.require(:article).permit(:title, :body, :published, :thumbnail)
  end
end

