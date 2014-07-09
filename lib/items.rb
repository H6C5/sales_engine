require 'bigdecimal'
require_relative 'invoice_item'
class Item 

  attr_reader :id,
              :name,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  attr_accessor :invoice_item,
                :merchant
                :revenue

  def initialize(data)
    @id          = data[:id]
    @name        = data[:name]
    @unit_price  = price(data[:unit_price])
    @merchant_id = data[:merchant_id]
    @created_at  = date_parse(data[:created_at])
    @updated_at  = date_parse(data[:updated_at])
    @revenue     = 0
  end

  def date_parse(date)
    if date != nil
      Date.parse(date)
    else
      date
    end
  end

  def price(number)
    price = number.to_f / 100
    BigDecimal.new(price.to_s)
  end

  def revenue
    items = inovice_item.select { |invoice_item| item_id == id }
    items.reduce(0) do |sum, invoice_item|
      sum += invoice_item.item_revenue
    end
    sum
  end

























end
