class ThermostatState
  include DataMapper::Resource
  attr_reader :temperature, :PSM, :city

  property :id, Serial
  property :temperature, Integer
  property :PSM, String
  property :city, String

end
