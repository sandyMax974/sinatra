require 'sinatra'

get '/random-cat' do
  @name = ["Amigo", "Misty", "Almond"].sample
  erb(:index)
end

get '/named-cat' do
  p params
  @name = params[:name]
  @last_name = params[:last_name]
  @age = params[:age]
  erb(:index)
end
