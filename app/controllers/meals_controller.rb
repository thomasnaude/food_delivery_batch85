require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @repo = meal_repository
    @view = MealsView.new
  end

  def add
    name = @view.ask_for(:name)
    price = @view.ask_for(:price)
    meal = Meal.new(name: name, price: price)
    @repo.add(meal)
  end

  def list
    meals = @repo.all
    @view.display(meals)
  end

  def destroy
    list
    meal_id = @view.ask_for(:meal).to_i
    @repo.destroy(meal_id)
  end
end
