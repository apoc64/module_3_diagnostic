class AltFuelPresenter
  def initialize(zip)
    afs = AltFuelService.new
    @results = afs.stations(zip)
  end

  def stations
    @results.map do |station|
      Station.new(station)
    end
  end
end
