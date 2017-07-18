require 'pry-byebug'

class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      print_menu
      action = ask_user_action
      route_action(action)
    end
  end

  private

  def print_menu
    puts "1. add a meal"
    puts "2. view all the meals"
    puts "3. add a customer"
    puts "4. view all the customers"
    puts "9. Exit"
  end

  def ask_user_action
    puts "What do you want to do ?"
    print "> "
    gets.chomp.to_i
  end

  def route_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then @running = false
    end
  end
end
# As a manager, I can add a meal
# As a manager, I can view all the meals
# As a manager, I can add a customer
# As a manager, I can view all the customers
# As a manager, I can view all the undelivered orders
# As a manager, I can add an order for a customer and assign it to a delivery guy
# As a delivery guy, I can view my undelivered orders
# As a delivery guy, I can mark an order as delivered
