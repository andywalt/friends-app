class AddDescriptonToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :description, :string
  end
end
