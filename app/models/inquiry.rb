class Inquiry < ApplicationRecord
  belongs_to :gallery
  validates :name, :email, :message, presence: true
end
