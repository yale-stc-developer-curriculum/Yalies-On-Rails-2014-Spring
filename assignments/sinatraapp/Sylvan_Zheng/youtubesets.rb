require "sinatra"

#To get this next line to work, run gem install sinatra-contrib first
#Or bundle install if it is in your gemfile
require "sinatra/reloader" if development?

configure do
  enable :sessions
  _method = true
end



get '/' do
  erb :index

end

sets = Hash.new

get '/sets' do
	@sets = sets
	erb :sets
end

##NEW page
get '/sets/new' do
  erb :new
end

##Create page
post "/sets" do
  #"Success! #{params[:videolist]}"
  sets[params[:setname]] = Hash.new
  sets[params[:setname]][:name] = params[:setname]
  sets[params[:setname]][:vidnums] = params[:videolist].split("\r\n")
  sets[params[:setname]][:desc] = params[:description]
  @sets = sets
  erb :sets
end

#display a set
get '/sets/:name' do
	@set = sets[params[:name]]
	erb :showset
end

#play a set
get '/sets/:name/play' do
	@videonumber = sets[params[:name]][:vidnums].sample
	erb :play
end

#edit a set
get '/sets/:name/edit' do
	@set = sets[params[:name]]
	@text = sets[params[:name]][:vidnums].join("\n")
	@desc = sets[params[:name]][:description]
	erb :edit
end

#update a set
post '/sets/:name' do
	puts "Set updated1!!!!!!"
	sets[params[:name]][:vidnums] = params[:videolist].split("\r\n")
	sets[params[:name]][:desc] = params[:description]
	@set = sets[params[:name]]
	erb :showset
end

#delete a set
delete '/sets/:name' do
	puts("test!!!!!!!!!!!!!!!")
	sets.delete(params[:name])
	@sets = sets
	erb :sets
end
