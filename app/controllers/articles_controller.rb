class ArticlesController < ApplicationController

  def show 
    @article = Article.find(params[:id])
  end 

  def index 
    @articles = Article.all
  end 

  def new
    @article = Article.new

  end 

  def create
    #'white list' what we allow - basically filtering through
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was succesfully created."
      redirect_to article_path(@article)
    else 
      render 'new'
    end 
  end 

  def edit 
    @article = Article.find(params[:id])

  end 

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was udpated successfully"
      redirect_to @article
    else 
      render 'edit'
    end 
  end 

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end 

end 