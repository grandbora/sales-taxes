require File.expand_path('../../product', __FILE__)

describe Product do 

  before(:each) do
    @name_1 = 'p_name'
    @shelf_price_1 = 20
    @product_1 = Product.new(@name_1, @shelf_price_1)

    @name_2 = 'p_name2'
    @shelf_price_2 = 22
    @product_2 = Product.new(@name_2, @shelf_price_2)
  end

  it "has a name and shelf price" do
    @product_1.name.should eq(@name_1)
    @product_1.shelf_price.should eq(@shelf_price_1)

    @product_2.name.should eq(@name_2)
    @product_2.shelf_price.should eq(@shelf_price_2)
  end

end