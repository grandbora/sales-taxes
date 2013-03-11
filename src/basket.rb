require File.expand_path('../Product/exempt_product', __FILE__)
require File.expand_path('../Product/taxed_product', __FILE__)
require File.expand_path('../Product/imported_exempt_product', __FILE__)
require File.expand_path('../Product/imported_taxed_product', __FILE__)

class Basket

  def initialize()
    @product_list = []
  end

  def add(product_data)
    class_name = get_product_class(product_data[:is_exempt], product_data[:is_imported])
    product = class_name.new(product_data[:name], product_data[:shelf_price])
    @product_list.push(product)
  end

  def get_products
    @product_list
  end

  def total_tax
    total_tax = 0
    get_products.each do |product|
      total_tax += 0.50
    end 
  end

  private
  def get_product_class(is_exempt, is_imported)
    return ImportedExemptProduct if is_exempt && is_imported
    return TaxedProduct unless is_exempt || is_imported
    return ImportedTaxedProduct if is_imported
    ExemptProduct
  end

end
