class AddUserToGalleries < ActiveRecord::Migration[7.2]
  def change
    add_reference :galleries, :user, foreign_key: true
  end
end
