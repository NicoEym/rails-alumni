class AddYearToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :start_year_prepa, :integer
    add_column :users, :contact_details, :string
    add_column :users, :sector, :string
    add_column :users, :school_description, :text
    add_column :users, :personal_path, :text
    add_column :users, :project, :text
    add_column :users, :memories, :text
    add_column :users, :availability_to_help, :text
    add_column :users, :link_network, :string
  end
end
