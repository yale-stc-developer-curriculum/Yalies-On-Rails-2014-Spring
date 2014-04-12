# myapp.rb
require 'sinatra'

get '/' do
  '<h1>Hello world!</h1>'
end

get '/hello/:name' do
  "hi " + params[:name]
end
