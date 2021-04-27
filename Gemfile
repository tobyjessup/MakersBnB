# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'pg'
gem 'puma'
gem 'rack'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'bcrypt'
gem "sinatra-flash"

group :development do
  gem 'shotgun'
  gem 'sinatra-reloader'
end

group :test do
  gem 'capybara'
  gem 'coveralls_reborn', '~> 0.20.0', require: false
  gem 'launchy'
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  
end
