class AddOccupationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :occupation, :text
    add_column :users, :hobbies, :text
  end
end
