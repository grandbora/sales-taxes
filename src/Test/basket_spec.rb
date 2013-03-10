require File.expand_path('../../basket', __FILE__)

describe Basket do 

  it "add to basket" do
    quantity = 1
    name = 'book'
    shelf_price = '12.49'
    is_exempt = true
    is_imported = false
    basket = Basket.new
    basket.add(quantity, name, shelf_price, true, false)
  end

end
