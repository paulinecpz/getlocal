class Picture < ApplicationRecord
  belongs_to :store
  mount_uploader :photo, PhotoUploader

end
