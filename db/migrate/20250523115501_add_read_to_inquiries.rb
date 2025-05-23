class AddReadToInquiries < ActiveRecord::Migration[7.2]
  def change
    add_column :inquiries, :read, :boolean
  end
end
