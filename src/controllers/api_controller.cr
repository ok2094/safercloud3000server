require "file_controller"

class ApiController < ApplicationController

  def authenticate

  end

  def create
    user = User.new(user_params.validate!)
    FileController.create_directory(User.username)

    if user.valid? && user.save
      respond_with 201 do
        json user.to_json
      end
    else
      results = {status: "invalid"}
      respond_with 422 do
        json results.to_json
      end
    end
  end

  def get_files

  end

  def upload_file

  end

  def download_file

  end

  def delete_file

  end

  def user_params
    params.validation do
      required(:username) { |f| !f.nil? }
      #required(:cryptokey) { |f| !f.nil? }
      required(:password) { |f| !f.nil? }
    end
  end
end
