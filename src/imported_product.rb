require File.expand_path('../product', __FILE__)
require File.expand_path('../Module/import_tax', __FILE__)

class ImportedProduct < Product
  include ImportTax
end
