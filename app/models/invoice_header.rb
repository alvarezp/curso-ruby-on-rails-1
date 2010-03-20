class InvoiceHeader < ActiveRecord::Base
  validates_presence_of :folio
end
