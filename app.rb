require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/listing'
require './lib/user'
require_relative 'database_connection_setup'

class MakersBnB < Sinatra::Base
   
   configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  register Sinatra::Flash
 

  get '/' do
    erb :'user/signup'
  end
  
  get '/user/login' do
    
    erb :'user/login'
    
  end

  post '/signup' do
    if params[:password] != params[:password_confirmation]
      flash[:notice] = "Passwords do not match"
      redirect '/'
    else  
    User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    redirect 'user/login'
    end
  end

  post '/login' do
   redirect '/listing'
  end
  
  get '/listing' do
    erb :"/listing/index"
  end

  get '/listing/new' do
    erb :"listing/new"
  end

  post '/listing/new' do
    # @listing = Listing.all
    redirect '/listing'
  end

  run! if app_file == $PROGRAM_NAME
end
