require 'sinatra'
require 'pry'
require 'erb'
require 'sinatra/reloader' if development?

configure do
	enable :sessions
	_method = true
end

sets = {}

get '/' do
	"hello"
end

get '/sets' do
	@sets = sets.keys
	erb :homepage
end

get '/sets/new' do
	erb :new
end

post '/sets' do
	sets[params[:setname]] = params[:videolist].split("\n")
	"Success"
end

get '/sets/:name' do
	@my_list = sets[params[:name]]
	if @my_list != nil
		erb :list_videos
	end
end

get '/sets/:name/play' do
	@videonumber = sets[params[:name]].sample()
	erb :play
end

get '/sets/:name/edit' do
	@name = params[:name]
	temp = ""
	my_list = sets[params[:name]]
	my_list.each do |entry|
		temp += entry
		temp += "\n"
	end
	@my_string = temp
	erb :edit
end

post '/sets/:name' do
	sets[params[:name]] = params[:videolist].split("\n")
	@my_list = sets[params[:name]]
	erb :list_videos
end

delete '/sets/:name' do
	sets.delete(params[:name])
	"Successfully removed the set"
end