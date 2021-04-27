require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listing'
require './lib/user'
require_relative 'database_connection_setup'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'user/signup'
  end
  
  get '/user/login' do
    erb :'user/login'
  end

  post '/signup' do
    User.create(username: params[:username],email: params[:email], password: params[:password])
    redirect 'user/login'
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

  run! if app_file == $PROGRAM_NAME
end
