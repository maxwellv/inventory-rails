class Jewelry < ActiveRecord::Base
  def sell(buyer)
    if !self.sellable || (self.user_id == buyer.id)
      return false
    else
      self.update({:user_id => buyer.id, :sellable => false})
      return true
    end
  end

  def mark_for_sale
    self.update({:sellable => true}) if !self.sellable
  end

  def verify_input
    msg = nil
    if self.jewelry_type == nil
      msg = "You must specify a valid jewelry type."
    elsif self.materials_cost.to_i <= 0
      msg = "You must specify a valid materials cost."
    elsif self.hours_worked.to_i <= 0
      msg = "You must specify a valid number of hours worked."
    end
    return msg
  end
end
