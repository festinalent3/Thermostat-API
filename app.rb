ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/cross_origin'
require 'json'
require './models/thermostatState'


class ThermostatAPI < Sinatra::Base
  register Sinatra::CrossOrigin
  enable :cross_origin

  get '/state' do
    content_type :json
    state = ThermostatState.last
    if !state
      state = ThermostatState.create(temperature: 21, PSM: 'on', city: 'Stockholm')
    end
    return state.to_json
  end

  post '/temperature' do
    ThermostatState.last.update(:temperature => params[:temperature])
  end

  post '/PSM' do
    ThermostatState.last.update(:PSM => params[:PSM])
  end

  post '/city' do
    ThermostatState.last.update(:city => params[:city])
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
