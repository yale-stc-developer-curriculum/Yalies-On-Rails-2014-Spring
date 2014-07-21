require "sinatra"
require "./sinatra_ssl"
#To get this next line to work, run gem install sinatra-contrib first
require "sinatra/reloader" if development?
require "uri"
require "cgi"






configure do
  enable :sessions
  #HTML can pass only get/post methods. This enables us to get delete (see my post on piaza)
  _method = true
  set :port, 8443
  set :ssl_certificate, "server.crt"
  set :ssl_key, "server.key"
end


helpers do
  def randomvideo(set)
    set.sample
  end

  #We're trying not to use the rest of these helpers any more, but they're here to make the pmj code below still work for comparison
  def embedyoutube(videonumber)
    %{
    <body style="margin:0;">
    <object height="100%" width="100%"><param name="movie" value="http://www.youtube.com/v/#{videonumber}&autoplay=1" /><embed height="100%" src="http://www.youtube.com/v/#{videonumber}&autoplay=1" type="application/x-shockwave-flash" width="100%"></embed></object>
    </body>
    }
  end
end

##INDEX
##Main Welcome Page
get '/' do
  erb :index 
end

##New, RESTful code

##just view parameters (should be blank) for debugging purposes
get '/params' do
  erb :index_with_params
end

#Session for troubleshooting
get '/session' do
  erb :index_with_session
end

##NEW page
get '/sets/new' do
  erb :new
end

#This is what really happens after submitting the form
#also: old habbits die hard: for now, I will define the variables before I initialize them!
post "/sets/new" do
  @error = 0
  name = params[:Set].to_s
  
  links = []
  key=[]

  if session["sets"].nil?
    session["sets"] = Hash.new
  end
  
  #if there are more than one element in the links box, split them and append to links
   if !params[:linkz].match(/\r\n/).nil?
    links = params[:linkz].split("\r\n")
    key = links
   else 
  #otherwise just add this one element to links
    links = [params[:linkz]]
    key = links
   end
    #parsing the links. I don't really know what exactly is happening, but I know why it is happening ;P
    key = key.map{|x| if x.to_s =~ URI::regexp
        CGI.parse(URI.parse(x.to_s).query)['v']
      end}
      
      key = key.map{|x| x[0] if !x.nil?}

      session["sets"].store(name.to_s, {"name" => name.to_s, "vidnums" => key, "links" => links})
      @error = 3

      if key.include?(nil) or name == ""
        @error = 1
        session["sets"].delete(name)
      end

  erb :index
end

#Session page for troubleshooting the session
get '/session' do
  session[:sessiontestvariable] = 3.14
  session.inspect
end

#display a a list of all the sets possible!
get '/sets' do
  erb :list
end

#delete from session the set of name :name. This really just redirects us to a form where we confirm
get '/sets/:name/destroy' do |name|
  @name = name
  erb:destroy
end

#actually destroy the set
delete '/sets/:name' do |name|
  session["sets"].delete(name.to_s)
  @error = 4
  erb:index
end

#pull up the form with which we actually edit the set
get '/sets/:name/edit' do |name|
  @name = name
  erb:edit
end

#after submitting the form. Really just overwriting the velues under key in session. 
put '/sets/:name' do |name|
  
  links = []
  key=[]
  
  #if there are more than one element in the links box, split them and append to links
   if !params[:linkz].match(/\r\n/).nil?
    links = params[:linkz].split("\r\n")
    key = links
   else 
  #otherwise just add this one element to links
    links = [params[:linkz]]
    key = links
   end
    #parsing the links. I don't really know what exactly is happening, but I know why it is happening ;P
    key = key.map{|x| if x.to_s =~ URI::regexp
        CGI.parse(URI.parse(x.to_s).query)['v']
      end}
      
      key = key.map{|x| x[0] if !x.nil?}

      session["sets"].store(name.to_s, {"name" => name.to_s, "vidnums" => key, "links" => links})
      @error = 5

      if key.include?(nil) or name == ""
        @error = 1
        session["sets"].delete(name)
      end

  erb :index
end


#play a random video from a set with name :name
get '/sets/:name' do |name|
  @videonumber = randomvideo(session["sets"][name.to_s]["vidnums"])
  erb :play
end