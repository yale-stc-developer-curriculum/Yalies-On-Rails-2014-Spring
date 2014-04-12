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

# def parseVids list
#   a = params["videolist"].scan(/\S+\r\n/)
#   "<p>#{a}</p>"

##CREATE page
post "/sets" do
  a = params["videolist"].scan(/\S+\r\n/).map! {|a| a.chomp}
  session["sets"].store(params["setname"], {"name" => params["setname"], "vidnums" => a})
  redirect to('/')
    
  # %{<p>#{session["sets"]}</p>}
  
  #One way to debug is to print variable values to the page
  #make sure the last line in this block is the thing you want printed, and comment out anything below
  #Uncomment the next line to make some show up on the page
  #params.to_s

  #If you don't want to use pry you can comment this out, but it might help!
  #Pry will halt the server whenever it hits this line. The terminal tab you have that has the sinatra server running
  # => will have an irb-like command prompt in it and you can manipulate params and session and everything from here
  # binding.pry
  
  #parse the youtubelinks params into separate video numbers - from a comma separated string into an array
  #set the session stuff for the set to equal the right things
  
  # "success going to 'post /sets!'" #just for testing, we shouldn't render this in the end but instead render an erb
  
  redirect to('/')

  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

get "/hello/:name" do
  @name = params[:name]
  session[:peter] = "bob"
  
  erb :hello, :locals => {:name => params[:name]}
end

##SHOW page
get "/sets/:setname" do
  #find the set in session, set the variables to @variables so the view can have them
  erb :show #just describe what the set has in it, displaying that on the page
end

##PLAY page
get "/sets/:setname/play" do
  #find the set in session
  # session[params[:setname]]

  #Pull out a random videonumber and set that to an @variable so the view can have it
  erb :play #actually plays the embedded video!
end

##EDIT page
get "/sets/:setname/edit" do
  #parse the youtubelinks params into separate video numbers - from a comma separated string into an array
  #find the setname, set the variables to @variables so the view can have them - it will make them the form defaults
  erb :edit #same as new except it puts in the form defaults.
end

##UPDATE page
put "/sets/:setname" do
  #find setname in session
  #update the variables in session to match parameters
  "success going to 'put /sets/:setname!'" #just for testing, we shouldn't render this in the end but instead render an erb
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

##DESTROY page
delete "/sets/:setname" do
  #delete the set setname from session
  "success going to 'delete /sets/:setname'!" #just for testing, we shouldn't render this in the end but instead render an erb
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
