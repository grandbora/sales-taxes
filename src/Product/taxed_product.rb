require File.expand_path('../product', __FILE__)
require File.expand_path('../../Module/basic_tax', __FILE__)

class TaxedProduct < Product
  include BasicTax
end
