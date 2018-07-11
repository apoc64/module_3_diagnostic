class AltFuelService
  def stations(zip, radius = 6, fuel_type = "ELEC,LPG", limit = 10)
    stations_data = parse(get("alt-fuel-stations/v1/nearest.json?location=#{zip}&radius=#{radius}&fuel_type=#{fuel_type}&limit=#{limit}"))
    stations_data[:fuel_stations]
  end

  def get(resource)
    Faraday.get("https://developer.nrel.gov/api/#{resource}&api_key=#{ENV["api_key"]}").body
  end

  def parse(json)
    JSON.parse(json, symbolize_names: true)
  end
end
