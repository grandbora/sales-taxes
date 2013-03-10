module BasicTax

  def initialize(name, shelf_price)
    super(name, shelf_price) 
    set_basic_tax_percent(10)
  end
  
end
