class Station
  attr_reader :name,
              :distance,
              :fuel_type,
              :access_time

  def initialize(attributes)
    @name = attributes[:station_name]
    @distance = attributes[:distance]
    @fuel_type = attributes[:fuel_type_code]
    @access_time = attributes[:access_days_time]
  end
end
