require "file_utils"

class FileController < ApplicationController

  before_action do
    only :delete_file { delete_params.validate! }
  end

  def upload_file
    ufile = params.files["ufile"]
    filename = ufile.filename

    if !filename.is_a?(String)
      results = {status: "invalid", error: "No filename included in upload"}
      respond_with 422 do
        json results.to_json
      end
    else
      File.rename(ufile.file.path, "userfiles/#{filename}")
      results = {status: "ok"}
      respond_with 200 do
        json results.to_json
      end
    end
  end

  def download_file
    
  end

  def delete_file
    if File.file?("userfiles/#{params["filename"]}")
      FileUtils.rm_r(params["filename"])
    end
  end

  def get_file_list
    Dir.glob("*").select {|f| File.file? f}
  end

  def delete_params
    params.validation do
      required(:filename, "Filename missing") { |f| !f.nil? }
    end
  end
end
