class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end
   
  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredient => params[:ingredient], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/articles/:id' do
  @article = Article.find_by_id(params[:id])
  erb :show
end

  get '/articles/:id/edit' do  #load edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
  end
 
  patch '/articles/:id' do #edit action
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
  end
  
  delete '/articles/:id/delete' do #delete action
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
  end

end
