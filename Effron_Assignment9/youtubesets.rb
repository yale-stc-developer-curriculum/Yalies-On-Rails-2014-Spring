require "sinatra"
require "sinatra/reloader" if development?
 
 
configure do
  enable :sessions

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
get '/beyonce' do
  erb :play
  #embedyoutube(randomvideo(beyoncevideos))
end
 
get '/pmj' do
  embedyoutube(randomvideo(pmjvideos))
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

get '/sets' do
  "Sets are these"
end

post "/sets" do
  #Convert parameters from form into a set to put in sessions
  setname = params[:setname]
  videolist = params[:videolist].split("\r\n")
  session[:sets][setname] = {"name"=>setname,"vidnums"=>videolist}
  #{}"Write out" + params["videolist"][3]
  #if ((params["videolist"][3]) == ' ')
  #  "Yeahhh"
  #end
  #while (params["videolist"[i]] != ' ')
   # params["videolist"][i] #Parse this by space/newline
    #i = i+1
  #end

  #session[nameinbrackets] = hash, name in brackets could be one of the params
  #{}"Success!" + "Write out"
  #You want the form to submit to this URL
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

