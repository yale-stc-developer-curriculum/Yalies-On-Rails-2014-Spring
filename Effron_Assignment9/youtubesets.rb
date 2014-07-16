require "sinatra"
require "sinatra/reloader" if development?
require "pry"
 
 
configure do
  enable :sessions
  _method = true #This allows us to use put and delete requests from HTML forms
end
 


helpers do
  def randomvideo(set)
    set.sample
  end
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
  erb :index #render the erb file called index
  #{}"<h1>Hi!</h1><h2>If you know the url you can play a random video from set of youtube videos!</h2>"
end
 
configure do
  enable :sessions
  end 
##SHOW
##Display the Video Sets
get '/sets/:setname/play' do |setname|
  @videonumber = randomvideo(session['sets'][setname]["vidnums"])
  erb :play
end
 
get '/sets/:setname/edit' do |setname|
  @setname = setname
  @videos = session['sets'][setname]["vidnums"].join("\n")
  erb :edit
end
 
 get '/session' do
    session[:sessiontestvariable] = 3.14
    session.inspect
  end

##NEW PAGE

get '/sets/new' do
  erb :new
end

#Create page

#post '/sets/:setname' do |setname|
#  redirect '/sets/:setname'
#end

get '/sets' do
  session['sets'].inspect
end

post '/sets/:setname' do

end


##UPDATE page
put '/sets/:setname' do |setname|
  session['sets'][setname]["vidnums"] = params["videos"].split("\r\n")
  session['sets'][setname].inspect

  #vidstoadd = params['videostoadd'].split("\r\n")
  #vidstodelete = params['videostodelete'].split("\r\n")
  #session['sets'][setname]["vidnums"] << vidstoadd
  #redirect '/sets/:setname' 
  #session['sets'][setname].inspect
  #session['sets'][setname]["vidnums"].delete()
end

delete '/sets/:setname' do |setname|
  session['sets'].delete(setname)
  redirect '/sets'
  
end


post '/sets' do
  if (session['sets'] == nil)
    session['sets'] = Hash.new 
  end
  setname = params['setname']
  videolist = params['videolist'].split("\r\n")
  session['sets'][setname] =  {"name" => setname, "vidnums" => videolist}
  redirect '/sets'
end

get '/sets/:setname' do |setname|
  @setname = setname
  @videos = session['sets'][setname]["vidnums"]
  erb :show
end

 get '/sets/new/:setname/:videonumber' do |setname, videonumber|
  #session
  #setname = "pharrell"
  #videonumber = "y6Sxv-sUYtM"
  session[setname] = [videonumber]
  "Video " + videonumber + " is now the only video in setname " + setname
end

get '/sets/add/:setname/:videonumber' do |setname, videonumber|
  session[setname] << videonumber
  "Video " + videonumber + " has been added to set " + setname
end

##Play the Pharrell video set
##NOTE THAT THIS IS HOW YOU PLAY SETS!!
#Returning HTML form for editing a set should just be editing a set from sessions
 get '/sets/pharrell' do
  @videonumber = randomvideo(session["pharrell"])
  erb :play
end

##just view blank params
get '/params' do
  params.inspect
end

#put is for updating things, should look the same as a post form
 
##try using the ?var1=1&var2=lol type
 
##try using the Sinatra type
get '/favorite/:fruit' do |fruit|
  var1 = 2
  var2 = 4
  "My favorite fruit is the " + fruit.to_s + " and I like it " + (var1*var2).to_s + " times"
  #params["fruit"] also works instead of fruit
end

get '/add/:num1/:num2' do |num1, num2|
  "My favorite number is the sum of yours: " + (num1.to_i+num2.to_i).to_s
end 
 
#Session for troubleshooting
get '/session' do
  session.inspect
end

