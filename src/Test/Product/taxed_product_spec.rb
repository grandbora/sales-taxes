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

  it "a taxed product has 10% basic tax" do
    @product_1.basic_tax.should eq(2.25)
    @product_2.basic_tax.should eq(4.05)
    @product_3.basic_tax.should eq(0.6)
  end

  it "a taxed product doesnt have import tax" do
    @product_1.import_tax.should eq(0)
    @product_2.import_tax.should eq(0)
    @product_3.import_tax.should eq(0)
  end

  it "has a tax sum" do
    @product_1.tax_sum.should eq(2.25)
    @product_2.tax_sum.should eq(4.05)
    @product_3.tax_sum.should eq(0.6)
  end

  it "has a final cost" do
    @product_1.final_price.should eq(24.42)
    @product_2.final_price.should eq(44.2)
    @product_3.final_price.should eq(6.6)
  end

end