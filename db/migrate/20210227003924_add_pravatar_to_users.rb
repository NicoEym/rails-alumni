class AddPravatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pravatar_number, :integer
  end
end
