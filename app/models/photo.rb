class Photo < ActiveRecord::Base
  
  mount_uploader :file, PhotoUploader
  
  attr_accessible :file
  
end