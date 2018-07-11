require 'rails_helper'

describe 'alt fuel service' do
  it 'can return station data' do
    afs = AltFuelService.new
    stations = afs.stations(80203)

    expect(stations).to be_a(Array)
    expect(stations.first).to be_a(Hash)
    expect(stations.count).to eq(10)

    less_than_six_miles = stations.all? do |station|
      station[:distance] < 6
    end
    expect(less_than_six_miles).to eq(true)

    right_fuel_types = stations.all? do |station|
      station[:fuel_type_code] == "ELEC" || station[:fuel_type_code] == "LPG"
    end
    expect(right_fuel_types).to eq(true)

    sorted_stations = stations.sort_by do |station|
      station[:distance]
    end
    is_sorted = (sorted_stations == stations)
    expect(is_sorted).to eq(true)
  end
end
