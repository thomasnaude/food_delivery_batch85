require_relative "../views/orders_view"
require_relative "../views/employees_view"

class OrdersController
  def initialize(order_repository)
    @order_repository = order_repository
    @view = OrdersView.new
    @customers_view = CustomersView.new
    @meals_view = MealsView.new
    @employees_view = EmployeesView.new
  end

  def list_undelivered(employee=nil)
    undelivered = @order_repository.undelivered(employee)
    @view.display(undelivered)
  end

  def add_and_assign
    customer_id = get_customer_id
    meal_id = get_meal_id
    delivery_guy_id = get_delivery_guy_id
    @order_repository.build_order_and_add(customer_id, meal_id, delivery_guy_id)
  end

  def mark_as_delivered(employee)
    list_undelivered(employee)
    order_id = @view.ask_for(:order)
    order = @order_repository.find(order_id)
    order.delivered!
  end

  private

  def get_customer_id
    customers = @order_repository.customers
    @customers_view.display(customers)
    @view.ask_for(:customer)
  end

  def get_meal_id
    meals = @order_repository.meals
    @meals_view.display(meals)
    @view.ask_for(:meal)
  end

  def get_delivery_guy_id
    delivery_guys = @order_repository.delivery_guys
    @employees_view.display(delivery_guys)
    @view.ask_for(:delivery_guy)
  end
end
