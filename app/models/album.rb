class Album < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :tags,  allow_destroy: true
  scope :search, ->(query){
   return all if query.blank?
   left_joins(:tags).where("albums.title ILIKE :q OR tags.name ILIKE :q",q: "%#{query}%").distinct
  }
end

