class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.references :user
      t.date :date
      t.integer :status

      t.timestamps
    end
  end
end
