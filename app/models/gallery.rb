class Gallery < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many_attached :photos
  has_many :inquiries, dependent: :destroy

  validates :artist, presence: true
  validates :description, presence: true
  validates :date, presence: true

  validate :image_presence

  private

  def image_presence
    errors.add(:image, "must be attached") unless image.attached?
  end
end
