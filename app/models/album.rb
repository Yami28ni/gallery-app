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
  }

  def tags_attributes=(attributes)
    attributes.each do |i, tag_attribute|
      if tag_attribute[:_destroy] == "1"
        tag = self.tags.find_by(id: tag_attribute[:id])
        self.tags.delete(tag) if tag
        next
      end

      name = tag_attribute[:name].to_s.strip.downcase
      next if name.blank?
      tag = Tag.find_or_create_by(name: name)
      self.tags << tag unless self.tags.include?(tag)
    end
  end
end



