require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "The_Amazing_Bucket_List_App"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in? 
      !!current_user
      #true if user is logged in, otherwise false. Use !! to take a value and turns it into boolean reflection of its truthiness.
    end

    def current_user
      @current_user ||= User.find_by(:id session[:user_id])
    end
  end

end
