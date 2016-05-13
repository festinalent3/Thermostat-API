require './models/thermostatState'

describe ThermostatState do

  let!(:state) do
    ThermostatState.create(temperature: 20, PSM: 'on', city: 'Stockholm')
  end

  it 'saves a temperature' do
    expect(state.temperature).to eq(20)
  end
  it 'saves a power savning mode' do
    expect(state.PSM).to eq('on')
  end
  it 'saves a city' do
    expect(state.city).to eq('Stockholm')
  end

  it 'can update temperature' do
    state.setTemperature(30)
    expect(state.temperature).to eq(30)
  end

end
