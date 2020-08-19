require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "The_Amazing_Bucket_List_App"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
    
    def logged_in? 
      !!current_user
      #true if user is logged in, otherwise false. Use !! to take a value and turns it into boolean reflection of its truthiness.
    end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def edit_privileges? (bucket_filler)
      bucket_filler.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in? 
        flash[:errors] = "Please log in to view page"
        redirect '/'
      end
    end
  end
end


  

