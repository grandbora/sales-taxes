require File.expand_path('../exempt_product', __FILE__)
require File.expand_path('../../Module/basic_tax', __FILE__)

class TaxedProduct < ExemptProduct
  include BasicTax
end
