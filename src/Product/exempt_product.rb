require File.expand_path('../../Module/tax_calculator', __FILE__)

class ExemptProduct
  include TaxCalculator

  def initialize(name, shelf_price)
    @name, @shelf_price = name, shelf_price.to_f
    set_basic_tax_percent(0)
    set_import_tax_percent(0)
  end

  def name
    @name
  end

  def shelf_price
    @shelf_price
  end

  def quantity
    1 # multiple quantities are not supported, there isn't such requirement yet
  end

  def basic_tax
    calculate_tax(shelf_price, @basic_tax_percent)
  end

  def import_tax
    calculate_tax(shelf_price, @import_tax_percent)
  end

  def tax_sum
    (basic_tax + import_tax).round(2) #avoid floating point arithmetic issues
  end

  def final_cost
    (shelf_price + tax_sum).round(2) #avoid floating point arithmetic issues
  end

  private
  def set_basic_tax_percent(basic_tax_percent)
    @basic_tax_percent = basic_tax_percent
  end

  def set_import_tax_percent(import_tax_percent)
    @import_tax_percent = import_tax_percent
  end

end
