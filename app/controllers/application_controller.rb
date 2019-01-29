class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end
   
  post '/articles' do
    @article = Article.create(:title => params[:title], :content => params[:content])
    redirect to "/articles/#{@article.id}"
  end
  
  get '/articles/:id' do
  @article = Article.find_by_id(params[:id])
  erb :show
end

end
