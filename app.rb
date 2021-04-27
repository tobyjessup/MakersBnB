require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require_relative 'database_connection_setup'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'user/signup'
  end

  post '/signup' do
    User.create(username: params[:username],email: params[:email], password: params[:password])
    redirect 'user/login'
  end

  get '/user/login' do
    erb :'user/login'
  end

  

  run! if app_file == $PROGRAM_NAME

end