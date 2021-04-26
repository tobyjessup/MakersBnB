require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'/signup'
  end

  post '/signup' do
    User.create(username: params[:username],email: params[:email], password: params[:password])
    redirect '/login'
  end

  get '/login' do
    erb :'/login'
  end

  run! if app_file == $PROGRAM_NAME

end