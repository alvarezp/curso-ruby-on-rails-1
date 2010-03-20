class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :nombre
      t.string :address
      t.string :rfc

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
