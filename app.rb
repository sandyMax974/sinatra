require 'sinatra'

get '/cat' do
  @name = ["Amigo", "Misty", "Almond"].sample
  erb(:index)
end
