require 'sinatra/base'

class UsersController < ApplicationController
  get '/login' do
    erb :login
  end
#the purpose of this get route is show user login page!
#the purpose od Post is to receive the login for, find the user and log the user in.
post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
  #log the user in - create user session.
  session[:user_id] = @user.id #this is what actually logs user in.
  puts session
  flash[:message] = "Welcome, #{@user.name}!"
  # flash[:notice] = "Invalid user input. Please try again."
  redirect "/users/#{@user.id}"
  else
    flash[:errors] = "Invalid user input. Please try again."
    redirect '/login'
  #tell user they entered invalid credentials...redirect to user landing page.
  # erb :welcome
  end
end
#route get signup is to get users to a signup form. 
get '/signup' do
  #erb (render) a view
  erb :signup
end

post '/users' do
  #persist a user that onle has name, email and password
    @user = User.create(params)
  if @user.save
    session[:user_id] = @user.id
    flash[message] = "Account successfully Created, #{@user.name}! Check off that Bucket List!" 
    
    redirect "/users/#{@user.id}" 
    #redirect acually writes in url of request or get request or http request. 
    #Because we are in a post request redirect sends you url, which usually does not happen in post request. 
    #ERB is just a rendering of the file. 
    # erb :'/users/show' 
  else
    flash[:errors] = "Failure Creating Account...Please Try Again: #{@user.errors.full_messages.to_sentence}!"
    #include a message if user did something wrong
    redirect '/signup'

  end
end
#Users Show route
get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @bucket_fillers = @user.bucket_fillers
  redirect_if_not_logged_in
  if @user != current_user
    redirect "/users/#{current_user.id}"
  end

  erb :'/users/show'

end

get '/logout' do
  session.clear
  redirect '/'

end
end