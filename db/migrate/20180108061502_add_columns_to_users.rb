class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :birthday, :date
    add_column :users, :sex, :integer, default: 0
    add_column :users, :school_name, :string
  end
end
