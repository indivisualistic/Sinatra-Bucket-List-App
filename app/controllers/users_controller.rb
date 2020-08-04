class UsersController < ApplicationController
  get '/login' do
    erb :login
  end
#the purpose of this get route is show user login page!
#the purpose od Post is to receive the login for, find the user and log the user in.
post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
  #log the user in - create user session.
  session[:user_id] = @user.id #this is what actually logs user in.
  puts session
  redirect "/users/#{@user.id}"
  else
  #tell user they entered invalid credentials...redirect to user landing page.
  # erb :welcome
  end
end

get '/signup' do

end

#Users Show route
get '/users/:id' do
"This is where user show route is located"
# erb :welcome
end
end