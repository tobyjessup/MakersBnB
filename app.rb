require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/listing'
  end

  get '/listing' do
    erb :"/listing/new"
  end

  post '/listing/new' do
    # @listing = Listing.all
    redirect '/listing'
  end


  run! if app_file == $PROGRAM_NAME

end