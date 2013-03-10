module ImportTax

  def initialize(name, shelf_price)
    super(name, shelf_price)
    set_import_tax_percent(5)
  end
  
end 