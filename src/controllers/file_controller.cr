require "file_utils"

class FileController < ApplicationController

  #before every action check if logged in and if all params available
  before_action do
    logged_in?
    only :delete_file { delete_params.validate! }
  end

  #uploads file to user folder
  def upload_file
    ufile = params.files["ufile"]
    filename = ufile.filename

    if !filename.is_a?(String)
      results = {status: "invalid", error: "No filename included in upload"}
      respond_with 422 do
        json results.to_json
      end
    else
      File.rename(ufile.file.path, "userfiles/#{current_user}/#{filename}")
      results = {status: "ok"}
      respond_with 200 do
        json results.to_json
      end
    end
  end

  #not implemented yet
  def download_file
    if File.file?("userfiles/#{current_user}/#{params["filename"]}")
      #respond_with 200 do

      #end
    end
  end

  #deletes file by name
  def delete_file
    if File.file?("userfiles/#{current_user}/#{params["filename"]}")
      FileUtils.rm_r(params["filename"])
    else
      results = {status: "invalid", error: "File doesn't exist"}
      respond_with 422 do
        json results.to_json
      end
    end
  end

  #returns array of files in repo
  def get_file_list
    Dir.glob("userfiles/#{current_user}/*").select {|f| File.file? f}
  end

  #needed params for delete
  def delete_params
    params.validation do
      required(:filename, "Filename missing") { |f| !f.nil? }
    end
  end
end
