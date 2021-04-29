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
    @user = User.find(id: session[:user_id])
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
    user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
   # session[:username] = user.username
    redirect 'user/login'
    end
  end

  post '/login' do
    user = User.authenticate(username: params[:username], password: params[:password])
    session[:user_id] = user.id
   redirect '/listing'
  end
  
  get '/listing' do
    @listing = Listing.all
    erb :"listing/index"
  end

  get '/listing/new' do
    erb :"listing/new"
  end

  post '/listing/new' do
    listing = Listing.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/listing'
  end

  get '/listing/:id/booking' do

    @listing = Listing.find(id: params[:id])
    erb :"listing/booking"
  end

  run! if app_file == $PROGRAM_NAME
end
