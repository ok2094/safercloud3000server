require "file_utils"

class FileController < ApplicationController
  def get_file_list(username)
    
  end

  def create_directory(username)
    FileUtils.mkdir(username)
  end
end
