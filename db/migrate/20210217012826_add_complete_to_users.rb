class AddCompleteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_profile_complete?, :boolean, :default => false, :null => false
  end
end
