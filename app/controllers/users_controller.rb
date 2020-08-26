require 'sinatra/base'

class UsersController < ApplicationController
  get '/login' do
    erb :login
  end

post '/login' do
  @user = User.find_by(email: params[:email])
  
  if @user && @user.authenticate(params[:password])
  session[:user_id] = @user.id 
  puts session
  flash[:message] = "Welcome, #{@user.name}!"
  
  redirect "/users/#{@user.id}"
  else
    flash[:errors] = "Invalid user input. Please try again."
    redirect '/login'
  
  end
end

get '/signup' do
  erb :signup
end

post '/users' do
    @user = User.create(params)
  if @user.save
    session[:user_id] = @user.id
    flash[message] = "Account successfully Created, #{@user.name}! Check off that Bucket List!" 
    
    redirect "/users/#{@user.id}" 

  else
    flash[:errors] = "Failure Creating Account...Please Try Again: #{@user.errors.full_messages.to_sentence}!"
    
    redirect '/signup'

  end
end

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