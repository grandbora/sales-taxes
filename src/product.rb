require File.expand_path('../Module/tax_calculator', __FILE__)

class Product
  include TaxCalculator

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
    calculate_tax(@shelf_price, @sales_tax_percent)
  end

  def import_tax
    calculate_tax(@shelf_price, @import_tax_percent)
  end

  private
  def set_sales_tax_percent(sales_tax_percent)
    @sales_tax_percent = sales_tax_percent
  end

  def set_import_tax_percent(import_tax_percent)
    @import_tax_percent = import_tax_percent
  end

end
