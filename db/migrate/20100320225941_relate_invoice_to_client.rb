class RelateInvoiceToClient < ActiveRecord::Migration
  def self.up
    add_column :invoice_headers, :client_id, :integer
  end

  def self.down
    drop_column :invoice_headers, :client_id
  end
end
