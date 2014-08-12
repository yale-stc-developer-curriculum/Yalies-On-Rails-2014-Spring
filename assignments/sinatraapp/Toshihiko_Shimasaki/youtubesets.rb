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
   "<a href=\"/\">Home</a> 
   <h1>This page lists all the video sets</h1>
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
#  session[:sets] = Hash.new
  #This should include more
##Get data
  videosetname = params[:setname] 
  videoarray = params[:videolist].split("\r\n")
  
##{ "SETNAME" => { "name" => "SETNAME", vidnums => ["VID1", "VID2", "VID3"] } }
  session[:sets].merge!( videosetname => { :name => videosetname, :vidnums => videoarray  } )
##
##  "Success!"
  pageoutput = "<a href=\"/\">Home</a> "
  pageoutput += "<h2>New Video list \"" + session[:sets][videosetname][:name] + "\" created!</h2>"
  pageoutput
  end

get '/sets/:setname' do |setname|
#display a specific set
  "<h2>The video set \"" + session[:sets][setname][:name] + "\" has " + "\"" + session[:sets][setname][:vidnums].join(", ") + "\"." + "</h2>"
end

get '/sets/:setname/play' do |setname|
#play a specific set
  videoarray = session[:sets][setname][:vidnums]
## Seems the following doesn't work...  
##videoarray.each do |videonumber|
##    @videonumber = videonumber
##	erb :play
##  end
  @videonumber = videoarray[rand(videoarray.size)]
  erb :play
end

get '/sets/:setname/edit' do |setname|
#return an HTML form for editing a set
  videoarray = session[:sets][setname][:vidnums]
  @videoarray = videoarray
  @setname = setname
## pageoutput will be the html output
## abondonded using erb b/c not sure how to implement a loop in erb -> started using erb. 
  pageoutput = "<a href=\"/\">Home</a> "
  pageoutput += "<h1>Edit set \"" 
  pageoutput = pageoutput + setname + "\" \r\n"
  pageoutput = pageoutput + "</h1> <br> <form action=\"/sets/" + setname + "\" method=\"post\">\r\n" 
  pageoutput += "<input type=\"hidden\" name=\"_method\" value=\"put\" />\r\n"
  pageoutput += "<h2>check boxes for unwanted videos <br> \r\n</h2>"  
  videoarray.each do |dummy|
    pageoutput = pageoutput + "<label>" + dummy + "</label><input type=\"checkbox\" name=\"" + dummy + "\" value=\"test\" > <br> \n\r"
  end   
  pageoutput += "<label><h2>Videos to add</h2></label><textarea name=\"morevideolist\"></textarea><input type=\"submit\"></form>"  
  pageoutput
  erb :edit
end


put '/sets/:setname' do |setname|
#update a specific set
##  session[:sets][setname][:vidnums].each do |dummy|
##	if (params[dummy])
##		session[:sets][setname][:vidnums].delete(dummy)
##	end
  i = session[:sets][setname][:vidnums].size
  while i > 0 do
  i = i-1
  vidname = session[:sets][setname][:vidnums][i]
    if (params[vidname])
		session[:sets][setname][:vidnums].delete_at(i)
	end
	
  end
  session[:sets][setname][:vidnums] += params[:morevideolist].split("\r\n")
  pageoutput = "<a href=\"/\">Home</a> "
  pageoutput += "<h2>Now the video set \"" + session[:sets][setname][:name] + "\" has " + "\"" + session[:sets][setname][:vidnums].join(", ") + "\"." + "</h2><br>\n\r"
  pageoutput += "<a href=\"/sets/"  + setname + "/edit\">Go to edit page</a> "
  end

delete '/sets/:setname' do |setname|
#delete a specific set
  session[:sets].delete(setname)
end

get '/clear' do
  session.clear
  session[:sets] = Hash.new
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
