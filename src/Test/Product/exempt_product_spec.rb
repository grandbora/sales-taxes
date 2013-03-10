require File.expand_path('../../../Product/exempt_product', __FILE__)

describe ExemptProduct do 

  before(:each) do
    @name_1 = 'p_name1'
    @shelf_price_1 = 22.17
    @product_1 = ExemptProduct.new(@name_1, @shelf_price_1)

    @name_2 = 'p_name2'
    @shelf_price_2 = 40
    @product_2 = ExemptProduct.new(@name_2, @shelf_price_2)
  end

  it "has a name and shelf price" do
    @product_1.name.should eq(@name_1)
    @product_1.shelf_price.should eq(@shelf_price_1)
    @product_1.shelf_price.should be_kind_of(Float)

    @product_2.name.should eq(@name_2)
    @product_2.shelf_price.should eq(@shelf_price_2)
    @product_2.shelf_price.should be_kind_of(Float)
  end

  it "an exempt product's tax value is always 0" do
    @product_1.basic_tax.should eq(0)
    @product_2.basic_tax.should eq(0)

    @product_1.import_tax.should eq(0)
    @product_2.import_tax.should eq(0)

    @product_1.tax_sum.should eq(0)
    @product_2.tax_sum.should eq(0)
  end

  it "has a final cost which includes tax prices" do
    @product_1.final_cost.should eq(22.17)
    @product_2.final_cost.should eq(40)
  end

end