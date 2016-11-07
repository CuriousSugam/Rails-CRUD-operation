class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show]

  # this is executed when url patter is /articles/new
  def new
  end

  # this is executed when url pattern is /articles/
  def index
    @articles = Article.all
  end

  # this is executed when url pattern is /articles/  & method: POST
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article created successfully."
      redirect_to @article
    else
      flash[:notice] = "Error creating Article."
    end
  end

  # this is executed when url pattern is /articles/{id}/edit
  def edit
  end

  # this is executed when url pattern is /articles/{id} & method: PUT or PATCH
  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully."
      redirect_to @article
    else
      flash[:notice] = "Error updating Article."
      render 'edit'
    end
  end

  # this is executed when url pattern is /articles/{id} & method: GET
  def show
  end

  # this is executed when url pattern is /articles/{id} & method: DELETE
  def destroy
    if @article.destroy
      flash[:notice] = "Article #{@article.title} destroyed successfully."
    end
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  private
  def set_article
    # 
    @article = Article.find(params[:id])
  end

end


# Once the controller executes a method in this controller, it the renders the view lying in the folder name same as
# that of the controller and the filename same as that of the method.
# for eg. articles_controller#new once this is executed, it automatically renders the new.html.erb view lying in the
# articles folder of views folder hierarchy until and unless code to render other view is provided explicitly.
