class Photo < ApplicationRecord
  belongs_to :album
  has_many_attached :images
end
