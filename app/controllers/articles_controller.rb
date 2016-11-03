class ArticlesController < ApplicationController

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

    @article.save
    redirect_to @article
  end

  # this is executed when url pattern is /articles/{id}/edit
  def edit
    @article = Article.find(params[:id])
  end

  # this is executed when url pattern is /articles/{id} & method: PUT or PATCH
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # this is executed when url pattern is /articles/{id} & method: GET
  def show
    @article = Article.find(params[:id])
  end

  # this is executed when url pattern is /articles/{id} & method: DELETE
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end


# Once the controller executes a method in this controller, it the renders the view lying in the folder name same as
# that of the controller and the filename same as that of the method.
# for eg. articles_controller#new once this is executed, it automatically renders the new.html.erb view lying in the
# articles folder of views folder hierarchy until and unless code to render other view is provided explicitly.
