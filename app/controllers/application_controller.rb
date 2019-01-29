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
  
  get '/recipes/:id' do
  @recipe = Article.find_by_id(params[:id])
  erb :show
end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Article.find_by_id(params[:id])
    erb :edit
  end
 
  patch '/recipes/:id' do #edit action
    @recipe = Article.find_by_id(params[:id])
    @recipe.title = params[:title]
    @recipe.content = params[:content]
    @recipe.save
    redirect to "/recipes/#{@article.id}"
  end
  
  delete '/recipes/:id/delete' do #delete action
    @recipe = Article.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
