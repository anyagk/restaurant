class Order < ActiveRecord::Base
  belongs_to :party
  belongs_to :food

  # def comp_item(item, number)
  #   self.update(number_ordered: self.number_ordered - amount)
  # end
end