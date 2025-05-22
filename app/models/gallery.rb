class Gallery < ApplicationRecord
  has_one_attached :image

  validates :artist, presence: true
  validates :description, presence: true
  validates :date, presence: true

  validate :image_presence

  private

  def image_presence
    errors.add(:image, "must be attached") unless image.attached?
  end
end
