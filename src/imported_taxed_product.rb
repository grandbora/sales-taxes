require File.expand_path('../taxed_product', __FILE__)

class ImportedTaxedProduct < TaxedProduct

  def initialize(name, shelf_price)
    super(name, shelf_price)
    set_import_tax_percent(5)
  end

end