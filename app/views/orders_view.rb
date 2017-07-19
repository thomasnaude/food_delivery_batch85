require_relative "base_view"

class OrdersView < BaseView
  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal.name} - #{order.meal.price}"
      puts "#{order.customer.name}"
      puts "#{order.delivery_guy.username} [#{check(order.delivered?)}]"
      puts ""
    end
  end

  private

  def check(boolean)
    boolean ? "X" : " "
  end
end
