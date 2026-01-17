class Album < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :title,presence: true
  validates :description,presence: true

  accepts_nested_attributes_for :tags,  allow_destroy: true
  scope :search, ->(query){
   return all if query.blank?
   left_joins(:tags).where("albums.title ILIKE :q OR tags.name ILIKE :q", q: "%#{query}%").distinct
   def tags_attributes=(attributes)
    return if attributes.blank?

    self.tags = attributes.map do |_, tag_attr|
      name = tag_attr[:name].strip
      Tag.find_or_create_by(name: name) unless name.blank?
    end.compact
  end
  }
end

