require_relative "base_view"

class MealsView < BaseView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - #{meal.price}€"
    end
  end
end
