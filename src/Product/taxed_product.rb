require File.expand_path('../product', __FILE__)
require File.expand_path('../../Module/sales_tax', __FILE__)

class TaxedProduct < Product
  include SalesTax
end
