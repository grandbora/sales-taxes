require File.expand_path('../taxed_product', __FILE__)
require File.expand_path('../Module/import_tax', __FILE__)

class ImportedTaxedProduct < TaxedProduct
  include ImportTax
end
