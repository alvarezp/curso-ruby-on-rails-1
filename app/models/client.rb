class Client < ActiveRecord::Base
  has_many :invoice_headers
end
