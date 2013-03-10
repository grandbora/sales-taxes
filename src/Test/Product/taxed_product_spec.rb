require File.expand_path('../../../Product/taxed_product', __FILE__)

describe TaxedProduct do 

  before(:each) do
    @name_1 = 'p_name1'
    @shelf_price_1 = 22.17
    @product_1 = TaxedProduct.new(@name_1, @shelf_price_1)

    @name_2 = 'p_name2'
    @shelf_price_2 = 40.15
    @product_2 = TaxedProduct.new(@name_2, @shelf_price_2)

    @name_3 = 'p_name3'
    @shelf_price_3 = 6
    @product_3 = TaxedProduct.new(@name_3, @shelf_price_3)
  end

  it "a taxed product has 10% sales tax" do
    @product_1.sales_tax.should eq(2.25)
    @product_2.sales_tax.should eq(4.05)
    @product_3.sales_tax.should eq(0.6)
  end

  it "a taxed product doesnt have import tax" do
    @product_1.import_tax.should eq(0)
    @product_2.import_tax.should eq(0)
    @product_3.import_tax.should eq(0)
  end

end