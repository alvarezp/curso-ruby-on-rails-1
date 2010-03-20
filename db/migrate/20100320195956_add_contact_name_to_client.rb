class AddContactNameToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :contact_name, :string
  end

  def self.down
    remove_column :clients, :contact_name
  end
end
