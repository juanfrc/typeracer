class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    change_column :scores, :score, :decimal
  end
end
