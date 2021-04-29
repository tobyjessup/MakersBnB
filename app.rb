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

  before do
    @listing = Listing.all
    @user = session[:user]
  end
 

  get '/' do
    #@user = User.find(id: session[:user_id])
    erb :'user/signup'
  end
  
  get '/user/login' do
    
    erb :'user/login'
    
  end

  post '/signup' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    case user
    when 1
      flash[:username_exists_warning] = 'Username in use'
    when 2
      flash[:email_warning] = 'Email address already registered'
    when 3
      flash[:password_match] = 'The passwords entered do not match'
    else
      session[:user] = user
      redirect('/listing')
    end
    redirect('/')
  end
    
  
  post '/login' do
    user = User.authenticate(username: params[:username], password: params[:password])
    case user
    when 1
      flash[:username_warning] = 'Please check your username'
    when 2
      flash[:password_warning] = 'Please check your password'
    else
      session[:user] = user
      redirect('/listing')
    end
    redirect('/user/login')
  end

  post '/logout' do
    session.clear
    redirect('/')
  end
  
  get '/listing' do
    @listing = Listing.all
    erb :"listing/index"
  end

  get '/listing/new' do
    erb :"listing/new"
  end

  post '/listing/new' do
    listing = Listing.create(name: params[:name], description: params[:description], price: params[:price], user_id: @user.user_id)
    redirect '/listing'
  end

  get '/listing/:id/booking' do
    @listing = Listing.find(id: params[:id])
    erb :"listing/booking"
  end


  get '/about-us' do 
    erb :"/about-us"
  end
  
  post '/booking' do
    redirect '/listing'
  end

  run! if app_file == $PROGRAM_NAME
end
