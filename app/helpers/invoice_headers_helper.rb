module InvoiceHeadersHelper

  def humanize_bool(value)
    return "No" unless value
    "Yes"
  end

end
