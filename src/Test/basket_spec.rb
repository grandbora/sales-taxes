require File.expand_path('../../basket', __FILE__)

describe Basket do 

  it "adds the first input set" do
    product_data_1 = {:quantity => 1, :name => 'book', :shelf_price => 12.49,
      :is_exempt => true, :is_imported => false}
    product_data_2 = {:quantity => 1, :name => 'music CD', :shelf_price => 14.99,
      :is_exempt => false, :is_imported => false}
    product_data_3 = {:quantity => 1, :name => 'chocolate bar', :shelf_price => 0.85,
      :is_exempt => true, :is_imported => false}

    basket = Basket.new
    basket.add(product_data_1)
    basket.add(product_data_2)
    basket.add(product_data_3)

    basket_products = basket.get_products
    basket_products.should be_an_instance_of(Array)
    basket_products.count.should eq(3)

    basket_products[0].should be_an_instance_of(ExemptProduct)
    basket_products[0].quantity.should eq(1)
    basket_products[0].name.should eq('book')
    basket_products[0].final_cost.should eq(12.49)

    basket_products[1].should be_an_instance_of(TaxedProduct)
    basket_products[1].quantity.should eq(1)
    basket_products[1].name.should eq('music CD')
    basket_products[1].final_cost.should eq(16.49)

    basket_products[2].should be_an_instance_of(ExemptProduct)
    basket_products[2].quantity.should eq(1)
    basket_products[2].name.should eq('chocolate bar')
    basket_products[2].final_cost.should eq(0.85)
  end

end
