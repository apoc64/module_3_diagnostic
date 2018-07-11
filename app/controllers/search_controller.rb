class SearchController < ApplicationController
  def index
    zip = params[:q]
    @presenter = AltFuelPresenter.new(zip)
  end
end
