require "file_utils"

class UserController < ApplicationController

  before_action do
    only :create { create_params.validate! }
    only :login { login_params.validate! }
  end

  def show
    if user = User.find params["id"]
      respond_with 200 do
        json user.to_json
      end
    else
      results = {status: "not found"}
      respond_with 404 do
        json results.to_json
      end
    end
  end

  def create
    if User.find_by username: create_params["username"]
      results = {status: "invalid", error: "Username already taken"}
      respond_with 400 do
        json results.to_json
      end
    else
      user = User.new(create_params.to_h)
      user.password = create_params[:password]

      if user.valid? && user.save
        FileUtils.mkdir "userfiles/" + user.id.to_s

        results = {status: "created"}
        respond_with 201 do
          json results.to_json
        end
      else
        results = {status: "invalid"}
        respond_with 422 do
          json results.to_json
        end
      end
    end
  end

  def login
    user = User.find_by username: params["username"]

    if user && user.authenticate params["password"]
      #session[:current_user_id] = user.id
      jwt = Auth.generate(user.id)
      results = {status: "ok", token: jwt}
      respond_with 200 do
        json results.to_json
      end
    else
      results = {status: "unauthorized", error: "Invalid username/password"}
      respond_with 401 do
        json results.to_json
      end
    end
  end

  def create_params
    params.validation do
      required(:username, "Username missing") { |f| !f.nil? }
      required(:cryptokey, "Cryptokey missing") { |f| !f.nil? }
      required(:password, "Password missing") { |f| !f.nil? }
    end
  end

  def login_params
    params.validation do
      required(:username, "Username missing") { |f| !f.nil? }
      required(:password, "Password missing") { |f| !f.nil? }
    end
  end
end
