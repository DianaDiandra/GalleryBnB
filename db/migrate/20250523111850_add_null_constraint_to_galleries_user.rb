class AddNullConstraintToGalleriesUser < ActiveRecord::Migration[7.2]
  def change
    change_column_null :galleries, :user_id, false
  end
end
