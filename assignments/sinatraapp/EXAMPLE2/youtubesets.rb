require "sinatra"
#To get this next line to work, run `gem install sinatra-contrib` first
require "sinatra/reloader" if development?

require "pry"

configure do
  enable :sessions

  #allow us to use method="put" and method="delete"
  enable :method_override
end


#New, RESTful code skeleton!
#The old style of the code is available in the folder EXAMPLE
#You will need to run `bundle install` to install pry - especially if you get the error "pry not found"


##INDEX
##Main Welcome Page
get '/sets' do
  binding.pry
  if session["sets"] && session["sets"] != []
    @allsets = session["sets"]
    erb :index
  else
    "none yet, you should create one"
  end
end

##NEW page
get '/sets/new' do
  erb :new
end

##CREATE page
post "/sets" do
  #If you'd rather print variables to the page directly you can too
  #make sure the last line in this block is the thing you want printed, and comment out anything below
  #Uncomment the next line to make some show up on the page
  #params.to_s

  #If you don't want to use pry you can comment this out, but it might help!
  #Pry will halt the server whenever it hits this line. The terminal tab you have that has the sinatra server running
  # => will have an irb-like command prompt in it and you can manipulate params and session and everything from here
  #binding.pry

  #parse the youtubelinks params into separate video numbers - from a comma separated string into an array
  #set the session stuff for the set to equal the right things

  session["sets"] ||= {}
  session["sets"][params["setname"]] = params["videolist"].split("\n")

  #"success going to 'post /sets!'" #just for testing, we shouldn't render this in the end but instead render an erb

  redirect "/sets/" + params["setname"]
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

##SHOW page
get "/sets/:setname" do
  if session["sets"][params[:setname]]
    @setname = params[:setname]
    @videolist = session["sets"][params[:setname]].join("\n")
    #find the set in session, set the variables to @variables so the view can have them
    erb :show #just describe what the set has in it, displaying that on the page
  else
    "Set " + params[:setname] + " doesn't exist"
  end
end

##PLAY page
get "/sets/:setname/play" do
  #find the set in session
  #Pull out a random videonumber and set that to an @variable so the view can have it
  @videonumber = session["sets"][params["setname"]].sample
  erb :play #actually plays the embedded video!
end

##EDIT page
get "/sets/:setname/edit" do
  if session["sets"][params[:setname]]
    @setname = params[:setname]
    @videolist = session["sets"][params[:setname]].join("\n")

    erb :edit #same as new except it puts in the form defaults.
  else
    "Set " + params[:setname] + " doesn't exist"
  end
end

##UPDATE page
put "/sets/:setname" do
  session["sets"] ||= {}
  session["sets"][params["setname"]] = params["videolist"].split("\n")

  @setname = params[:setname]
  @videolist = session["sets"][params[:setname]]
  #what should the behavior be if they want to rename the set?
  #the submitted name from the form won't be able to change that's fine lol - because the url parameter overwrites the form's one

  #"success going to 'put /sets/:setname!'" #just for testing, we shouldn't render this in the end but instead render an erb
  redirect "/sets/" + params["setname"]
  #erb :show #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

##DESTROY page
delete "/sets/:setname" do
  #delete the set setname from session
  session["sets"].delete(params["setname"])
  redirect "/sets"
  "Session " + params["setname"] + " was deleted"
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end




#Session page for troubleshooting the session
get '/session' do
  session[:sessiontestvariable] = 3.14
  session.inspect
end
