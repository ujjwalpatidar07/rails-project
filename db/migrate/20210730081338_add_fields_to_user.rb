class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :contact_no, :string
  end
end
