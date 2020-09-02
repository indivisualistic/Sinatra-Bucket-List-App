
class BucketFillersController < ApplicationController
  
  get '/bucket_fillers' do
    
    if params["order"] == "reverse"
      @bucket_fillers = BucketFiller.all

    else
      @bucket_fillers = BucketFiller.all.reverse

    end
  
    erb :'/bucket_fillers/index'
  
  end
  
  
  get '/bucket_fillers/new' do
    erb :'bucket_fillers/new'
  end

  post '/bucket_fillers' do
    
    redirect_if_not_logged_in

    if params[:content] != ""
      flash[:message] = "Bucket Filled!"
      @bucket_filler = current_user.bucket_fillers.create(content: params[:content], completed: params[:completed])
        redirect "/bucket_fillers/#{@bucket_filler.id}"
      else 
        flash[:errors] = "Your Bucket is Empty...Please fill it up!"
        redirect '/bucket_fillers/new'  
    end
    end
  
    get '/bucket_fillers/:id' do
    set_bucket_filler
    
    erb :'/bucket_fillers/show'
  end


  get '/bucket_fillers/:id/edit' do
    set_bucket_filler
    redirect_if_not_logged_in
    if @bucket_filler.user == current_user
        erb :'/bucket_fillers/edit'
    else
      redirect "users/#{current_user.id}"
    end
  
  end


  
  patch '/bucket_fillers/:id' do
   set_bucket_filler
   redirect_if_not_logged_in
   if @bucket_filler.user == current_user && params[:content] != ""
    @bucket_filler.update(content: params[:content], completed: params[:completed])
   redirect "/bucket_fillers/#{@bucket_filler.id}"

  else
    redirect "users/#{current_user.id}"
  
  end
end

delete '/bucket_fillers/:id' do
  set_bucket_filler
  if edit_privileges?(@bucket_filler)
    @bucket_filler.destroy
    flash[:message] = "Bucket Entry Deleted"
    redirect '/bucket_fillers'
   
  else
     
     redirect '/bucket_fillers'
    
  end
end
    

  private

  def set_bucket_filler
    @bucket_filler = BucketFiller.find(params[:id])
  end
end

  

