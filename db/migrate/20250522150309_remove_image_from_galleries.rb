class RemoveImageFromGalleries < ActiveRecord::Migration[7.2]
  def change
    remove_column :galleries, :image, :string
  end
end
