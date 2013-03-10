require File.expand_path('../../imported_product', __FILE__)

describe ImportedProduct do 

  before(:each) do
    @name_1 = 'p_name1'
    @shelf_price_1 = 22.17
    @product_1 = ImportedProduct.new(@name_1, @shelf_price_1)

    @name_2 = 'p_name2'
    @shelf_price_2 = 40.15
    @product_2 = ImportedProduct.new(@name_2, @shelf_price_2)

    @name_3 = 'p_name3'
    @shelf_price_3 = 6
    @product_3 = ImportedProduct.new(@name_3, @shelf_price_3)
  end

  it "an imported product doesnt have sales tax" do
    @product_1.sales_tax.should eq(0)
    @product_2.sales_tax.should eq(0)
    @product_3.sales_tax.should eq(0)
  end

  it "an imported taxed product has 5% import tax" do
    @product_1.import_tax.should eq(1.15)
    @product_2.import_tax.should eq(2.05)
    @product_3.import_tax.should eq(0.3)
  end

end