class BucketFillersController < ApplicationController
  #adding a get bucket list/new to render a form to create a new entry
  get '/bucket_fillers/new' do
    erb :'bucket_fillers/new'
  end

  post '/journal_entries' do
    
  end
  #post request is made in bucket_fillers to create a new list nentry
  #show route for journal entry
  #index a route for all bucket_fillers
end