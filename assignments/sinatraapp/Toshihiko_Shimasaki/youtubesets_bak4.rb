require "sinatra"

#To get this next line to work, run gem install sinatra-contrib first
#Or bundle install if it is in your gemfile
require "sinatra/reloader" if development?

configure do
  enable :sessions
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
  def beyoncevideos
    ["QczgvUDskk0", "VBmMU_iwe6U", "Vjw92oUduEM", "4m1EFMoRFvY", "FHp2KgyQUFk"]
  end
  def pmjvideos
    ["pXYWDtXbBB0", "VBmCJEehYtU", "GZQJrM09jbU"]
  end
end

##INDEX
##Main Welcome Page
get '/' do
##	erb :index 
	"<h1>Hello</h1>
	<h2>This page will help you kill time by playing random youtube videos</h2>
	<a href=\"/sets\">Start here</a>
	"  
end



##Display the Video Sets, old-style where the videos are hard coded above
get '/beyonce' do
  #embedyoutube(randomvideo(beyoncevideos))
  @videonumber = randomvideo(beyoncevideos)
  erb :play
end

get '/pmj' do
  embedyoutube(randomvideo(pmjvideos))
end



##New, RESTful code

##NEW page
get '/sets' do
   "<h1>This page lists all the video sets</h1>
   <a href=\"/sets/new\">Create a new set</a>
   <h2>Existing video sets</h2>  
   "
##put some funcitionality here
end

get '/sets/new' do
  erb :new
end

##Create page --- This is a response to a form submission
post "/sets" do
  
  session[:sets] = Hash.new
  #This should include more
##Get data
  videosetname = params[:setname] 
  videoarray = params[:videolist].split("\r\n")
  
##{ "SETNAME" => { "name" => "SETNAME", vidnums => ["VID1", "VID2", "VID3"] } }
  session[:sets].merge!( videosetname => { :name => videosetname, :vidnums => videoarray  } )
##
##  "Success!"
  "<h2>New Video list \"" + session[:sets][videosetname][:name] + "\" created!</h2>"
end

get '/sets/:setname' do |setname|
#display a specific set
  "<h2>The video set \"" + session[:sets][setname][:name] + "\" has " + "\"" + session[:sets][setname][:vidnums].join(", ") + "\"." + "</h2>"
end

get '/sets/:setname/play' do
#play a specific set
end

get '/sets/:setname/edit' do
#return an HTML form for editing a set
end

put '/sets/:setname' do
#update a specific set
end

delete '/sets/:setname' do
#delete a specific set
end

get '/clear' do
  session.clear
  redirect '/'
end

##not the RESTful new page with the form we want, but a parameters way to make a new video set
get '/sets/new/:setname/:videonumber' do |setname, videonumber|
  #setname = "pharrell"
  #videonumber = "y6Sxv-sUYtM"
  session[setname] = [videonumber]
  "Video " + videonumber + "is now the only video in setname " + setname
end

get '/sets/add/:setname/:videonumber' do |setname, videonumber|
  session[setname] << videonumber
  "Video " + videonumber + "has been added to set " + setname
end


##Play the Pharrell video set - not necessary eventually, just for testing
get '/sets/pharrell' do
  @videonumber = randomvideo(session["pharrell"])
  #@videonumber = "y6Sxv-sUYtM"
  erb :play
end



#Session page for troubleshooting the session
get '/session' do
  session[:sessiontestvariable] = 3.14
  session.inspect
end


##example of sinatra input by url parameters
##The ?var=1&var2=2&var3=3 style works too, but Sinatra can give us prettier url parameters
get '/params/:idlol' do
  params.inspect
end

get '/favorite/:fruit' do |fruit|
  "My favorite fruit is the " + fruit.to_s
  #params["fruit"] also works instead of fruit
end

get '/add/:num1/:num2' do |num1, num2|
  ##your code here, as an example
end
