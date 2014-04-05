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
	erb :index
end

get '/sets' do
	@sets = {}
	sets.keys().each do |entry|
		@sets[entry] = sets[entry]["description"]
	end
	erb :homepage
end

get '/sets/new' do
	erb :new
end

post '/sets' do
	sets[params[:setname]] = {}
	sets[params[:setname]]["name"] = :setname
	sets[params[:setname]]["vidnums"] = params[:videolist].split("\n")
	sets[params[:setname]]["description"] = :description
	erb :success
end

get '/sets/:name' do
	@my_list = sets[params[:name]]["vidnums"]
	@description = sets[params[:name]]["description"]
	if @my_list != nil
		erb :list_videos
	end
end

get '/sets/:name/play' do
	@videonumber = sets[params[:name]]["vidnums"].sample()
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
	erb :success
end