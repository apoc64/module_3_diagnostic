class AltFuelPresenter
  def initialize(zip)
    afs = AltFuelService.new
    @results = afs.stations(zip)
  end

  def stations
    @results
  end
end
# @token = current_user.oauthtoken
# gh = Github.new(@token)
# if (param.to_i == current_user.id) || (param == current_user.username)
#   name = current_user.username
#   @is_current = true
# else
#   name = param
#   @is_current = false
# end
# @profile = gh.profile(name)
# @repos = gh.repositories(name).repositories
