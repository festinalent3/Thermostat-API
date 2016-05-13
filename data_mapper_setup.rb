require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/thermostatState'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/thermostat_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
