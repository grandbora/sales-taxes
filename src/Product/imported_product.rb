require File.expand_path('../exempt_product', __FILE__)
require File.expand_path('../../Module/import_tax', __FILE__)

class ImportedProduct < ExemptProduct
  include ImportTax
end
