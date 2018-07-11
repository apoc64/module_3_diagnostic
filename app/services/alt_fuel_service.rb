class AltFuelService
  def stations(zip)
    stations_data = parse(get("alt-fuel-stations/v1/nearest.json?location=#{zip}"))
    stations = stations_data[:fuel_stations]
  end

  def get(resource)
    Faraday.get("https://developer.nrel.gov/api/#{resource}&api_key=#{ENV["api_key"]}").body
  end

  def parse(json)
    JSON.parse(json, symbolize_names: true)
  end
end
