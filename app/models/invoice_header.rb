class InvoiceHeader < ActiveRecord::Base
  belongs_to :client
  validates_presence_of :folio

  named_scope :paid_invoices, lambda { |paid| { :conditions => ['paid = ?', paid] }}
end
