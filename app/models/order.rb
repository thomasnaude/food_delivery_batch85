class Order
  attr_reader :meal, :customer, :delivery_guy
  attr_accessor :id

  def initialize(args = {})
    @id = args[:id]
    @delivered = args[:delivered] || false
    @meal = args[:meal]
    @customer = args[:customer]
    @delivery_guy = args[:delivery_guy]
  end

  def delivered?
    @delivered
  end

  def delivered!
    @delivered = true
  end

  def self.csv_headers
    ['id', 'delivered', 'customer_id', 'employee_id', 'meal_id']
  end

  def to_csv_row
    [id, delivered?, customer.id, delivery_guy.id, meal.id]
  end
end
