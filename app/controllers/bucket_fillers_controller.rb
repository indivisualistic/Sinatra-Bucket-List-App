class BucketFillersController < ApplicationController
  
  get '/bucket_fillers' do
    @bucket_fillers = BucketFiller.all
    erb :'/bucket_fillers/index'
  end
  
  #adding a get bucket list/new to render a form to create a new entry
  get '/bucket_fillers/new' do
    erb :'bucket_fillers/new'
  end

  post '/bucket_fillers' do
    #create new journal entry and save it to the database
    #only save entry if there is content added
    if !logged_in?
      redirect '/'
    end
    
  
#params is a hash
    if params[:content] != ""
      bucket_filler = current_user.bucket_fillers.build(content: params[:content])
      if bucket_filler.save
        redirect "/bucket_fillers/#{bucket_filler.id}"
      
      end
    end
  redirect '/bucket_fillers/new'
   
    #only create entry if user is logged in. 
    
  end

  get '/bucket_fillers/:id' do
    set_bucket_filler
    # set_bucket_filler
    erb :'/bucket_fillers/show'
  end

#This route should send us to bucket fillers/edit.erb
#This will render an edit form. 
  get '/bucket_fillers/:id/edit' do
    set_bucket_filler
    if logged_in?
      if @bucket_filler.user == current_user
        erb :'/bucket_fillers/edit'
    else
      redirect "users/#{current_user.id}"
    end
    else 
    redirect '/'
  end

end
  #This actions job is to find journal entry, modify and redirect to show page of created post. 
  patch '/bucket_fillers/:id' do
   set_bucket_filler
   if logged_in?
    if @bucket_filler.user == current_user && params[:content] != ""
    @bucket_filler.update(content: params[:content])
   redirect "/bucket_fillers/#{@bucket_filler.id}"

  else
    redirect "users/#{current_user.id}"
  
  end
  else
    redirect '/'
  end
end

delete '/bucket_fillers/:id' do
  set_bucket_filler
  if edit_privileges?(@bucket_filler)
    @bucket_filler.destroy
    redirect '/bucket_fillers'
    # redirect
  else
     # redirect
     redirect '/bucket_fillers'
    # go somewhere else -- not deleted
  end
end
    # index route for all bucket entries






  #creating a helper method privately!
  private

  def set_bucket_filler
    @bucket_filler = BucketFiller.find(params[:id])
  end
end
  #post request is made in bucket_fillers to create a new list nentry
  #show route for journal entry
  #index a route for all bucket_fillers



