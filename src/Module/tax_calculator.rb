module TaxCalculator

  def calculate_tax(shelf_price, tax_percent)
    real_tax = calculate_real_tax(shelf_price, tax_percent)
    return 0 if real_tax == 0

    round_up(real_tax)
  end

  private
  def calculate_real_tax(shelf_price, tax_percent)
    shelf_price * tax_percent / 100
  end

  def round_up(real_tax)
    (real_tax * 20).ceil().to_f / 20
  end

end
