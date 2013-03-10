class TaxedProduct < Product
  def sales_tax
    real_tax = @shelf_price / 10
    (real_tax * 20).ceil().to_f / 20
  end
end