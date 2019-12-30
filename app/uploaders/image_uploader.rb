# encoding: utf-8

class ImageUploader < BaseUploader

  def store_dir
    "uploads/img/#{timestamp}"
  end
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
