require File.expand_path('../product', __FILE__)

class TaxedProduct < Product
  
  def initialize(name, shelf_price)
    super(name, shelf_price) 
    set_sales_tax_percent(10)
  end

end
