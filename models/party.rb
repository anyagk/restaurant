require_relative 'food'
require_relative 'order'
require_relative 'employee'



class Party < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :foods, through: :orders
  belongs_to :employee


  def self.free_table
    numbers = (1..15)
    table = numbers.to_a
    parties = Party.all
    not_paid = parties.where(paid: 'f')
    unavail = not_paid.map do |table|
      table.table_number
    end
    available = table - unavail  
  end

end
