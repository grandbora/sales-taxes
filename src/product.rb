class Product

  def initialize(name, shelf_price)
    @name, @shelf_price = name, shelf_price.to_f
    set_sales_tax_percent(0)
    set_import_tax_percent(0)
  end

  def name
    @name
  end

  def shelf_price
    @shelf_price
  end

  def sales_tax
    real_tax = calculate_tax(@sales_tax_percent)
    return 0 if real_tax == 0

    (real_tax * 20).ceil().to_f / 20
  end

  def import_tax
    real_tax = calculate_tax(@import_tax_percent)
    return 0 if real_tax == 0

    (real_tax * 20).ceil().to_f / 20
  end

  private
  def calculate_tax(tax_percent)
    @shelf_price * tax_percent / 100
  end

  def set_sales_tax_percent(sales_tax_percent)
    @sales_tax_percent = sales_tax_percent
  end

  def set_import_tax_percent(import_tax_percent)
    @import_tax_percent = import_tax_percent
  end

end
