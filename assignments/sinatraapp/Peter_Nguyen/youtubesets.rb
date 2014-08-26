require "sinatra" 
#To get this next line to work, run `gem install sinatra-contrib` first
require "sinatra/reloader" if development?

# require "pry"

configure do
  enable :sessions
  #allow us to use method="put" and method="delete"
  _method = true
end

#New, RESTful code skeleton!
#The old style of the code is available in the folder EXAMPLE
#You will need to run `bundle install` to install pry - especially if you get the error "pry not found"

get '/reset' do
  session["sets"] = {}
  redirect to('/')
end

##INDEX
##Main Welcome Page

get '/' do
  session["sets"] ||= {}
  erb :index
end

##NEW page
get '/sets/new' do
  erb :new
end

# "sets" => { "SETNAME" => { "name" => "SETNAME", "vidnums" => ["VID1", "VID2", "VID3"] } }

##CREATE page

post "/sets" do
  session["sets"] ||= {}
  a = params["videolist"].scan(/\S+\r\n|\S+/).map! {|a| a.chomp}
  session["sets"].store(params["setname"], {"name" => params["setname"], "vidnums" => a})
  redirect to('/')
end

# Testing purposes only
get "/hello/:name" do
  @name = params[:name]
  session[:peter] = "bob"  
  erb :hello, :locals => {:name => params[:name]}

end

##SHOW page
get "/sets/:setname" do
  session["sets"] ||= {}
  @setname = params[:setname]
  #find the set in session, set the variables to @variables so the view can have them
  erb :show #just describe what the set has in it, displaying that on the page
end

##PLAY page
get "/sets/:setname/play" do
  session["sets"] ||= {}
  #find the set in session
  # session[params[:setname]]
  @videonumber = session["sets"][params[:setname]]["vidnums"].sample
  #Pull out a random videonumber and set that to an @variable so the view can have it
  erb :play #actually plays the embedded video!
end

##EDIT page
get "/sets/:setname/edit" do
  session["sets"] ||= {}
  @setname = params[:setname]
  @vids = session["sets"][@setname]["vidnums"]
  #parse the youtubelinks params into separate video numbers - from a comma separated string into an array
  #find the setname, set the variables to @variables so the view can have them - it will make them the form defaults
  erb :edit #same as new except it puts in the form defaults.
end

##UPDATE page
put "/sets/:setname" do
  session["sets"] ||= {}
  a = params["videolist"].scan(/\S+\r\n|\S+/).map! {|a| a.chomp}
  session["sets"].store(params["setname"], {"name" => params["setname"], "vidnums" => a})
  #find setname in session
  redirect to('/')
  #update the variables in session to match parameters
  # "success going to 'put /sets/:setname!'" #just for testing, we shouldn't render this in the end but instead render an erb
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

##DESTROY page
delete "/sets/:setname" do
  session["sets"] ||= {}
  #delete the set setname from session
  session["sets"].delete(params[:setname])
  # "success going to 'delete /sets/:setname'!" #just for testing, we shouldn't render this in the end but instead render an erb
  redirect to('/')
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

#Session page for troubleshooting the session
get '/session' do
  session[:sessiontestvariable] = 3.14
  session.inspect
end


=begin

I had miscellaneous questions regarding how erb files properly pass information to and from
the controller; google was my friend

I also had some issues regarding the rigor of the specification, regarding what exactly function
each route is meant to serve

=end
