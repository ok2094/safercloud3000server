require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"

  #return bool if logged in
  def logged_in?
    !!current_user
  end

  #return id of current user
  def current_user
    if !params["token"].nil?
      user = User.find(Auth.decode(params["token"]))
      if user
        user.id.to_s
      end
    end
  end
end
