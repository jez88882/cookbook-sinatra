 #Sinatra app main file, the entry point, the one we want to run

require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

#-----------------------------

require_relative 'cookbook'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)

get '/' do
  @recipes = cookbook.all
  binding.pry
  erb :index
end

get '/new' do
  erb :about
end
