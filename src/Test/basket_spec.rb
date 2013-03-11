require File.expand_path('../../basket', __FILE__)

describe Basket do 

  it "adds the first input set" do

    # input    
    # 1 book at 12.49 
    # 1 music CD at 14.99 
    # 1 chocolate bar at 0.85

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

    # output
    # 1 book : 12.49 
    # 1 music CD: 16.49 
    # 1 chocolate bar: 0.85 
    # Sales Taxes: 1.50 
    # Total: 29.83
    basket_products = basket.get_products
    basket_products.should be_an_instance_of(Array)
    basket_products.count.should eq(3)

    basket_products[0].should be_an_instance_of(ExemptProduct)
    basket_products[0].quantity.should eq(1)
    basket_products[0].name.should eq('book')
    basket_products[0].final_price.should eq(12.49)

    basket_products[1].should be_an_instance_of(TaxedProduct)
    basket_products[1].quantity.should eq(1)
    basket_products[1].name.should eq('music CD')
    basket_products[1].final_price.should eq(16.49)

    basket_products[2].should be_an_instance_of(ExemptProduct)
    basket_products[2].quantity.should eq(1)
    basket_products[2].name.should eq('chocolate bar')
    basket_products[2].final_price.should eq(0.85)

    basket.total_tax.should eq(1.50)
    basket.total_price.should eq(29.83)
  end

  it "adds the second input set" do

    # input
    # 1 imported box of chocolates at 10.00 
    # 1 imported bottle of perfume at 47.50

    product_data_1 = {:quantity => 1, :name => 'imported box of chocolates', :shelf_price => 10.00,
      :is_exempt => true, :is_imported => true}
    product_data_2 = {:quantity => 1, :name => 'imported bottle of perfume', :shelf_price => 47.50,
      :is_exempt => false, :is_imported => true}

    basket = Basket.new
    basket.add(product_data_1)
    basket.add(product_data_2)

    # output
    # 1 imported box of chocolates: 10.50 
    # 1 imported bottle of perfume: 54.65 
    # Sales Taxes: 7.65 
    # Total: 65.15

    basket_products = basket.get_products
    basket_products.count.should eq(2)

    basket_products[0].should be_an_instance_of(ImportedExemptProduct)
    basket_products[0].quantity.should eq(1)
    basket_products[0].name.should eq('imported box of chocolates')
    basket_products[0].final_price.should eq(10.50)

    basket_products[1].should be_an_instance_of(ImportedTaxedProduct)
    basket_products[1].quantity.should eq(1)
    basket_products[1].name.should eq('imported bottle of perfume')
    basket_products[1].final_price.should eq(54.65)

    basket.total_tax.should eq(7.65)
    basket.total_price.should eq(65.15)
  end

end
