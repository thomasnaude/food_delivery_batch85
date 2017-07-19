require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(args = {})
    @csv_file = args[:csv_file]
    @meal_repository = args[:meal_repository]
    @customer_repository = args[:customer_repository]
    @employee_repository = args[:employee_repository]
    @elements = []
    load_csv
  end

  def undelivered(employee = nil)
    undelivered = @elements.reject { |element| element.delivered? }
    if employee
      undelivered = undelivered.select { |order| order.delivery_guy.id == employee.id }
    end
  end

  def customers
    @customer_repository.all
  end

  def meals
    @meal_repository.all
  end

  def delivery_guys
    @employee_repository.delivery_guys
  end

  def build_order_and_add(customer_id, meal_id, delivery_guy_id)
    order_args = {
      customer: @customer_repository.find(customer_id),
      meal: @meal_repository.find(meal_id),
      delivery_guy: @employee_repository.find(delivery_guy_id)
    }
    add(Order.new(order_args))
  end

  private

  def build_element(row)
    order_args = {
      id: row[:id],
      delivered: row[:delivered] == "true",
      customer: @customer_repository.find(row[:customer_id]),
      meal: @meal_repository.find(row[:meal_id]),
      delivery_guy: @employee_repository.find(row[:employee_id])
    }
    Order.new(order_args)
  end
end
