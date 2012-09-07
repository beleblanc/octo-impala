class Attachment < ActiveRecord::Base
  attr_accessible :description,  :name, :file
  belongs_to :attacheable, :polymorphic => true
  has_attached_file :file
  
  def file_extension
    self.file_file_name.to_s.split('.').last
  end

  def icon
    case file_extension
      when "doc","docx"
        "word"
      when "txt"
        "text"
      when "pdf"
        "pdf"
      when "jpg", "bmp", "png"
        "image"
      when "ppt"
        "powerpoint"
      when "xls", "xlsx"
        "excel"
      else
        "fileicon_bg"
    end
  end

end
