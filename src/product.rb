class Product

  def initialize(name, shelf_price)
   @name, @shelf_price = name, shelf_price.to_f
  end

  def name
   @name
  end

  def shelf_price
   @shelf_price
  end

  def sales_tax
   0
  end

  def import_tax
   0
  end

end
