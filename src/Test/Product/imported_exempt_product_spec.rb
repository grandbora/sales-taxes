require File.expand_path('../../../Product/imported_exempt_product', __FILE__)

describe ImportedExemptProduct do 

  before(:each) do
    @name_1 = 'p_name1'
    @shelf_price_1 = 22.17
    @product_1 = ImportedExemptProduct.new(@name_1, @shelf_price_1)

    @name_2 = 'p_name2'
    @shelf_price_2 = 40.15
    @product_2 = ImportedExemptProduct.new(@name_2, @shelf_price_2)

    @name_3 = 'p_name3'
    @shelf_price_3 = 6
    @product_3 = ImportedExemptProduct.new(@name_3, @shelf_price_3)
  end

  it "an imported product doesnt have basic tax" do
    @product_1.basic_tax.should eq(0)
    @product_2.basic_tax.should eq(0)
    @product_3.basic_tax.should eq(0)
  end

  it "an imported taxed product has 5% import tax" do
    @product_1.import_tax.should eq(1.15)
    @product_2.import_tax.should eq(2.05)
    @product_3.import_tax.should eq(0.3)
  end

  it "has a tax sum" do
    @product_1.tax_sum.should eq(1.15)
    @product_2.tax_sum.should eq(2.05)
    @product_3.tax_sum.should eq(0.3)
  end

  it "has a final cost" do
    @product_1.final_cost.should eq(23.32)
    @product_2.final_cost.should eq(42.2)
    @product_3.final_cost.should eq(6.3)
  end

end