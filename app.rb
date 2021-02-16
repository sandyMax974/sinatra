require 'sinatra'

get '/form-cat' do
  erb(:form)
end

post '/named-cat' do
  p params
  @name = params[:name]
  erb(:index)
end
