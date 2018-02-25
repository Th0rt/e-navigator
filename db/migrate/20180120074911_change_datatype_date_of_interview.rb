class ChangeDatatypeDateOfInterview < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :date, :datetime
  end
end
