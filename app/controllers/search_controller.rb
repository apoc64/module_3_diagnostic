class SearchController < ApplicationController
  def index
    zip = params[:q]
    @presenter = AltFuelPresenter.new(zip)
  end
end

# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["api_key"]}&location=80203
