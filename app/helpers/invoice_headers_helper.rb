module InvoiceHeadersHelper

  def humanize_bool(value)
    return "No" unless value
    "Yes"
  end

  def humanize_payment_mode(value)
    if value == 1
      return "Cash"
    elsif value == 2
      return "Check"
    end
    "Credit Card"
  end
end
