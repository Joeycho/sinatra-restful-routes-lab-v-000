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

end
