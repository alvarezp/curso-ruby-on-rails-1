class CreateInvoiceHeaders < ActiveRecord::Migration
  def self.up
    create_table :invoice_headers do |t|
      t.string :folio
      t.date :date
      t.boolean :paid
      t.integer :payment_mode

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_headers
  end
end
