#encoding: utf-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
  @barbers = Barber.all
end

get '/' do

  @barbers = Barber.all
  erb :index
end

get '/visit' do
  erb :visit
end

post '/visit' do

  c = Client.new params[:client]
  c.save



  erb "<h2>Спасибо, вы записались!</h2>"

end
