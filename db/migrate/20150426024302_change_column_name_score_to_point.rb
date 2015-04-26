class ChangeColumnNameScoreToPoint < ActiveRecord::Migration
  def change
  	# rename_column :scores, :score, :point
  	change_column :scores, :point,  :decimal
  end
end
