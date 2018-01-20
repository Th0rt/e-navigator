class ChangeColumnToInterview < ActiveRecord::Migration[5.1]
  def up
    change_column :interviews, :status, :integer, null: false, default: 0
  end
  def down
    change_column :interviews, :status, :integer
  end
end
