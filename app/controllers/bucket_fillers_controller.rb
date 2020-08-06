class BucketFillersController < ApplicationController
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
    @bucket_filler = BucketFiller.find(params[:id])
    # set_bucket_filler
    erb :'/bucket_fillers/show'
  end
#This route should send us to bucket fillers/edit.erb
#This will render an edit form. 
  get '/bucket_fillers/:id/edit' do
    erb :'/bucket_fillers/edit'
  end
  #post request is made in bucket_fillers to create a new list nentry
  #show route for journal entry
  #index a route for all bucket_fillers
end
