require 'csv'

require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/repositories/order_repository"
require_relative "app/controllers/orders_controller"
require_relative "router"

meal_repository = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new('data/customers.csv')
customers_controller = CustomersController.new(customer_repository)

employee_repository = EmployeeRepository.new('data/employees.csv')
sessions_controller = SessionsController.new(employee_repository)

order_repository = OrderRepository.new(
  csv_file: 'data/orders.csv',
  meal_repository: meal_repository,
  customer_repository: customer_repository,
  employee_repository: employee_repository
)
orders_controller = OrdersController.new(order_repository)

router_args = {
  meals_controller: meals_controller,
  customers_controller: customers_controller,
  sessions_controller: sessions_controller,
  orders_controller: orders_controller
}
router = Router.new(router_args)
router.run
